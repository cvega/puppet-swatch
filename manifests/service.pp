# = Class: swatch::service
# This class manages the swatch service
#
# == Parameters:
# $service:: Name of the swatch service. Defaults to 'swatch' (See swatch::defaults) [String]
#
# == Sample Usage:
# For most distros, this should be sufficient:
#   class { swatch::service: }
#
# If your service name is not 'swatch', simply override the default value for
# the $service parameter:
#   class { swatch::service:
#     service => 'swatch'
#   }
#
# The $service parameter can also be changed from the main swatch interface:
#   class { swatch:
#     service => 'swatch'
#   }
#
class swatch::service (
  $service
) {

  service { $service:
    ensure     => running,
    enable     => true,
    hasrestart => true
  }
}
