# Class: ryu::install
#
#
class ryu::install {

	include ryu::params

	#install the ryu server
	if !defined(Package['python-pip']) {
    	package { 'python-pip': ensure => latest, }
  	}

  	package { "ryu":
      ensure   => installed,
      provider => pip,
      require  => Package['python-pip'],
    }

	user { 'ryu':
	    ensure => present,
	    gid    => 'ryu',
	    system => true,
	    home   => '/var/lib/ryu',
	    shell  => '/bin/false'
	}

	group { "ryu":
		ensure => present,
		system => true,
	}

	file { "/etc/ryu":
	    ensure => "directory",
	    owner  => "ryu",
	    group  => "ryu",
	    mode   => 750,
	}

	file { "/var/log/ryu":
	    ensure => "directory",
	    owner  => "ryu",
	    group  => "ryu",
	    mode   => 750,
	}

	file { "/var/log/ryu/ryu.log":
		ensure => "file",
		owner  => "ryu",
		group  => "ryu",
		mode   => 640,
	}

	file { "/var/run/ryu":
	    ensure => "directory",
	    owner  => "ryu",
	    group  => "ryu",
	    mode   => 750,
	}

	file { "/etc/ryu/ryu.conf":
		path    => '/etc/ryu/ryu.conf',
		ensure  => file,
		content => template('ryu/ryu.conf.config.erb'),
		owner   => "ryu",
		group   => "ryu",
		mode    => 640,
	}

	if $::osfamily == 'Debian' {
		file { "/etc/init.d/ryu":
		  path    => '/etc/init.d/ryu',
		  ensure  => file,
		  content => template('ryu/ryu.erb'),
		  mode    => 755,
		  owner   => 'root',
		  group   => 'root',
		} ->
		file { "/etc/init/ryu.conf":
		  path    => '/etc/init/ryu.conf',
		  ensure  => file,
		  content => template('ryu/ryu.conf.erb'),
		  mode    => 755,
		  owner   => 'root',
		  group   => 'root',
		  notify  => Service["ryu"],
		}
	} else {
		error('ryu cannot be installed on this operating system. It does not have the supported initscripts. There is only support for Debian-based systems.')
	}
}