# Class: ryu::service
#
#
class ryu::service {

  if $::osfamily == 'Debian' {
    file { "/etc/init.d/ryu":
      path    => '/etc/init.d/ryu',
      ensure  => file,
      content => template('ryu/ryu.erb'),
      mode    => 755,
      owner   => 'root',
      group   => 'root',
    } ->
    file { "/etc/ryu/ryu.conf":
      path    => '/etc/init/ryu.conf',
      ensure  => file,
      content => template('ryu/ryu.conf.erb'),
      mode    => 755,
      owner   => 'root',
      group   => 'root',
      notify  => Service["ryu"],
    }
  } else {
    error('ryu cannot be installed on this operating system. It does not have the supported initscripts. There is only support for Debian-based systems.'
    )
  }

	# setup service
	service { "ryu":
	    enable => true,
		ensure => running,
		#hasrestart => true,
		#hasstatus => true,
		#require => Class["config"],
	}
}