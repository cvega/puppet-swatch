# = Class: swatch::package
# This class manages swatch package
#
# == Parameters:
# $package:: Name(s) of the swatch package(s). Defaults differ according to distro (see swatch::defaults) [Array]
# $ensure:: Set ensure value [String]
#
# == Sample Usage:
# The $package defaults should be suitable for most distros:
#   class { swatch::package: }
#
# If you package name differs from the defaults provided, simply override the
# package parameter:
#   class { swatch::package:
#     package => 'swatch-dev'
#   }
#
# The $package param can also be changed from the main swatch interface:
#   class { swatch:
#     package => 'swatch-dev'
#   }
#
class swatch::package (
  $package,
  $ensure
) {
    package { $package:
      ensure => $ensure
    }
}
