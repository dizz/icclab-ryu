# Class: ryu::params
#
#
class ryu::params {
  /* --------------------------------------------------*/
  # ryu daemon settings
  /* --------------------------------------------------*/
  $ryu_logdir    = '/var/log/ryu'
  # $ryu_rundir    = '/var/run/ryu'
  # $ryu_lockdir   = '/var/lock/ryu'
  $ryu_conf_file = '/etc/ryu/ryu.conf'
  $ryu_service   = '/usr/local/bin/ryu-manager'
}