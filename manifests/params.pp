# Class: ryu::params
#
#
class ryu::params {
  /* --------------------------------------------------*/
  # ryu daemon settings
  /* --------------------------------------------------*/
  $sys_rundir    = '/var/run'
  $ryu_logdir    = '/var/log/ryu'
  $ryu_rundir    = '/var/run/ryu'
  $ryu_conf_file = '/etc/ryu/ryu.conf'
  $ryu_service   = '/usr/local/bin/ryu-manager'
}