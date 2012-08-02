# = Class: swatch
# This class manages swatch and it's configuration
# 
# == Sample Usage:
# This class is useful for managing the whole swatch through a single interface.
#
# class { 'swatch':
# }
#
class swatch (
  $package = $package,
  $package_ensure = 'installed',
  $config = $config,
  $config_source,
  $init = $init,
  $var_dir = $var_dir,
  $etc_dir = $etc_dir,
  $service = $service,
  $logs = $logs
) inherits swatch::defaults {

    class { 'swatch::config':                                                      
      config        => $config,
      config_source => $config_source,
      service       => $service,                                                         
      init          => $init,                                                             
      var_dir       => $var_dir,                                                          
      etc_dir       => $etc_dir,
      logs          => $logs
    } ->
    class { 'swatch::package':
      package => $package,
      ensure  => $package_ensure
    } ->
    class { 'swatch::service':
      service => $service
    }
}
