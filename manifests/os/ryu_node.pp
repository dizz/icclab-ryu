class ryu::os::ryu_node (
		$ryu_server_ip      = '127.0.0.1',
		$ryu_server_port    = 8080,
		$ovsdb_interface    = 'eth0',
		$tunnel_interface   = 'eth0',
		$neutron_db_user    = 'neutron',
		$neutron_db_pass    = 'neutron',
		$db_host            = '127.0.0.1',
		$db_port            = 3306,
		$db_name            = 'neutron',
	)
{
	# node
	# sudo pip install ryu
	# sudo apt-get install neutron-plugin-ryu-agent
	# same ovs_ryu_plugin.ini  as server

	package { "neutron-plugin-ryu":
		ensure => installed,
	}

	package { "ryu":
		ensure   => installed,
		provider => pip
	}

	# Is the DB setting needed?
	neutron_plugin_ryu {
		'database/connection':   value => "mysql://${neutron_db_user}:${neutron_db_pass}@${db_host}:${db_port}/${db_name}";
		'OVS/openflow_rest_api': value => "${ryu_server_ip}:${ryu_server_port}";
		'OVS/ovsdb_interface':   value => $ovsdb_interface;
		'OVS/tunnel_interface':  value => $tunnel_interface;
	}
}