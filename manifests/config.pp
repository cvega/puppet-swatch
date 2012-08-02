# = Class: swatch::config
# This class manages the swatch config file
#
# == Parameters:
# See the swatch config file for details on each parameter
#
class swatch::config (
  $service,
  $config,
  $config_source,
  $init,
  $var_dir,
  $etc_dir,
  $logs
) {

  file { $etc_dir:
    ensure => directory
  }
  ->
  file { $var_dir:
    ensure => directory
  }
  ->
  file { $config:
    ensure  => present,
    replace => true,
    source  => "puppet:///modules/$config_source/config.swatch",
    mode    => '0644',
    notify  => Service[$service]
  }
  ->
  file { $init:                                                                    
    ensure  => present,
    replace => true,
    content => template("${module_name}/swatch.init.erb"),                              
    mode    => '0755',
    notify  => Service[$service]
  }  
}
