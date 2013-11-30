# Class: ryu::config
#
#
class ryu::config (
		$wsapi_host = '127.0.0.1',
		$wsapi_port = '8080',
		$ofp_listen_host = '127.0.0.1',
		$ofp_listen_port = '6633',
		$apps_list = "ryu.app.gre_tunnel,ryu.app.quantum_adapter,ryu.app.rest,ryu.app.rest_conf_switch,ryu.app.rest_tunnel,ryu.app.tunnel_port_updater,ryu.app.rest_quantum",
		$neutron_url = "http://127.0.0.1:9696",
		$neutron_admin_auth_url = 'http://127.0.0.1:35357/v2.0',
		$neutron_admin_username = 'admin',
		$neutron_admin_password = 'admin',
		$neutron_admin_tenant_name = 'service',
		$neutron_auth_strategy = 'keystone',
		$neutron_controller_addr = 'tcp:127.0.0.1:6633'
	)
{
	ryu_ini_config{
		'DEFAULT/wsapi_host':                value => $wsapi_host;
		'DEFAULT/wsapi_port':                value => $wsapi_port;
		'DEFAULT/ofp_listen_host':           value => $ofp_listen_host;
		'DEFAULT/ofp_listen_port':           value => $ofp_listen_port;
		'DEFAULT/app_lists':                 value => $apps_list;
		'DEFAULT/neutron_url':               value => $neutron_url;
		'DEFAULT/neutron_admin_auth_url':    value => $neutron_admin_auth_url;
		'DEFAULT/neutron_admin_username':    value => $neutron_admin_username;
		'DEFAULT/neutron_admin_password':    value => $neutron_admin_password;
		'DEFAULT/neutron_admin_tenant_name': value => $neutron_admin_tenant_name;
		'DEFAULT/neutron_auth_strategy':     value => $neutron_auth_strategy;
		'DEFAULT/neutron_controller_addr':   value => $neutron_controller_addr;
	}
}
