class ryu::os::ryu_server (
		$neutron_db_user    = 'neutron',
		$neutron_db_pass    = 'neutron',
		$db_host            = '127.0.0.1',
		$db_port            = 3306,
		$db_name            = 'neutron',
		$ryu_server_ip      = '127.0.0.1',
		$ryu_server_port    = 8080,
		$ovsdb_interface    = 'eth0',
		$tunnel_interface   = 'eth0',
		$neutron_ryu_plugin = 'neutron.plugins.ryu.ryu_neutron_plugin.RyuNeutronPluginV2',
	)
{

	# taken from http://docs.openstack.org/admin-guide-cloud/content/ch_networking.html
	# install agent
	package { "neutron-plugin-ryu":
		ensure => installed,
	}

	#set default plugin
	# can't overwrite - need to sed this
	exec { "set-core-ryu-plugin":
		command => "sed -i 's/neutron.plugins.openvswitch.ovs_neutron_plugin.OVSNeutronPluginV2/neutron.plugins.ryu.ryu_neutron_plugin.RyuNeutronPluginV2/' /etc/neutron/neutron.conf",
		unless  => "grep \"RyuNeutronPluginV2\" /etc/neutron/neutron.conf",
		path => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
		#refreshonly => true,
	}

	# neutron_config { 
	# 	'DEFAULT/core_plugin': value => $neutron_ryu_plugin;
	# }

	# /etc/neutron/plugins/ryu/ryu.ini 
	# 'Database/connection':   value => "mysql://${neutron_db_user}:${neutron_db_pass}@${db_host}:${db_port}/${db_name}";
	neutron_plugin_ryu {
		'ovs/openflow_rest_api': value => "${ryu_server_ip}:${ryu_server_port}";
		'ovs/ovsdb_interface':   value => $ovsdb_interface;
		'ovs/tunnel_interface':  value => $tunnel_interface;
	}

	# DHCP agent
	neutron_dhcp_agent_config {
		'DEFAULT/ovs_use_veth': value => 'True';
	}
}