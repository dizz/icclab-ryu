# Class: ryu::service
#
#
class ryu::service ($enable = true,){

	# setup service
	service { "ryu":
	  enable => $enable,
		ensure => running,
		hasrestart => true,
		hasstatus => true,
		require => Class["Ryu::Config"],
	}
}
