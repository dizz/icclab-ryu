# Class: ryu::config
#
#
class ryu::config (
		$wsapi_host = '127.0.0.1',
		$wsapi_port = '8080',
		$ofp_listen_host = '127.0.0.1',
		$ofp_listen_port = '6633',
	)
{
	# what more needs config? apps - format?
	ryu_ini_conf{
		'DEFAULT/wsapi_host':   value => $wsapi_host;
		'DEFAULT/wsapi_port':   value => $wsapi_port;
		'DEFAULT/ofp_listen_host':   value => $ofp_listen_host;
		'DEFAULT/ofp_listen_port':   value => $ofp_listen_port;
	}

}
