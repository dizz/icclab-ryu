class ryu::os::ryu_server (
		$db_user            = 'neutron',
		$db_pass            = 'neutron',
		$db_host            = '127.0.0.1',
		$db_port            = 3306,
		$db_name            = 'neutron',
		$ryu_server_ip      = '127.0.0.1',
		$ryu_server_port    = 8080,
		$ovsdb_interface    = 'eth0',
		$tunnel_interface   = 'eth0',
		$integration_bridge = 'br-int',
		$firewall_driver    = 'neutron.agent.linux.iptables_firewall.OVSHybridIptablesFirewallDriver',
	)
{

	# taken from http://docs.openstack.org/admin-guide-cloud/content/ch_networking.html
	# install agent
	package { "neutron-plugin-ryu":
		ensure => installed,
	}

	#set default plugin - can't overwrite - need to sed this
	exec { "set-core-ryu-plugin":
		command     => "sed -i 's/neutron.plugins.openvswitch.ovs_neutron_plugin.OVSNeutronPluginV2/neutron.plugins.ryu.ryu_neutron_plugin.RyuNeutronPluginV2/' /etc/neutron/neutron.conf",
		unless      => "grep \"RyuNeutronPluginV2\" /etc/neutron/neutron.conf",
		path        => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
		refreshonly => true,
	}

	neutron_plugin_ryu {
		'database/connection':           value => "mysql://${db_user}:${db_pass}@${db_host}:${db_port}/${db_name}";
		'ovs/integration_bridge'         value => $integration_bridge,
		'ovs/openflow_rest_api':         value => "${ryu_server_ip}:${ryu_server_port}";
		'ovs/ovsdb_interface':           value => $ovsdb_interface;
		'ovs/tunnel_interface':          value => $tunnel_interface;
		'securitygroup/firewall_driver': value => $firewall_driver;
	}

	# DHCP agent
	neutron_dhcp_agent_config {
		'DEFAULT/ovs_use_veth': value => 'True';
	}
}