# Class: ryu::install
#
#
class ryu::install {
	
	#install the ryu server
	if !defined(Package['python-pip']) {
    	package { 'python-pip': ensure => latest, }
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

  file { "/etc/ryu/ryu.conf":
		path    => '/etc/ryu/ryu.conf',
		ensure  => file,
		content => template('ryu/ryu.conf.erb'),
		owner   => "ryu",
		group   => "ryu",
		mode    => 640,
  }
}