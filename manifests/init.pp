# == Class: ryu
#
# Full description of class ryu here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { ryu:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
#
class ryu {

	#install the ryu server
	package { "name":
		ensure => installed,
	}

	# create user, group, files
	user { "name":
		comment => "First Last",
		home => "/home/name",
		ensure => present,
		#shell => "/bin/bash",
		#uid => '501',
		#gid => '20'
	}

	group { "name":
		gid => ,
	}

	file { "name":
		ensure => file,
	}

	file { "name":
		ensure => file,
	}
	
	# setup service
	service { "":
	    enable => true,
		ensure => running,
		#hasrestart => true,
		#hasstatus => true,
		#require => Class["config"],
	}

}
