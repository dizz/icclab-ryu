class ryu::os::ryu_node (
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

	if !defined(Package['python-pip']) {
    	package { 'python-pip': ensure => latest, }
  	}

  	package { "ryu":
		ensure   => installed,
		provider => pip,
	}

	package { "neutron-plugin-ryu":
		ensure => installed,
	}

	neutron_plugin_ryu {
		'database/connection':           value => "mysql://${db_user}:${db_pass}@${db_host}:${db_port}/${db_name}";
		'ovs/integration_bridge'         value => $integration_bridge,
		'ovs/openflow_rest_api':         value => "${ryu_server_ip}:${ryu_server_port}";
		'ovs/ovsdb_interface':           value => $ovsdb_interface;
		'ovs/tunnel_interface':          value => $tunnel_interface;
		'securitygroup/firewall_driver': value => $firewall_driver;
	}
}