# = Class swatch::defaults
# This class provides default values for all swatch classes
#
# == Parameters
# Most parameters can be overridden from the main swatch interface
#
class swatch::defaults {
  case $operatingsystem {
    Debian,Ubuntu,CentOS,RedHat,CloudLinux: {
      $package = 'swatch'
    }
    default: {
      err( "swatch is not yet implemented on $operatingsystem" )
    }
  }

  $config = '/etc/swatch/config.swatch'
  $config_source = 'swatch'
  $init = '/etc/init.d/swatch'
  $var_dir = '/var/run/swatch'
  $etc_dir = '/etc/swatch'
  $logs = [ '/var/log/debug', '/var/log/messages' ]
  $service = 'swatch'
}
