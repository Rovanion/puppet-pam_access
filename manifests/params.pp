# Class: pam_access::params
#
# Default parameters
#
# [Remember: No empty lines between comments and class definition]
class pam_access::params {

  if (($facts['os']['family'] == 'RedHat') and (versioncmp($::operatingsystemrelease, '5.0') >= 0)) or (
    ($::operatingsystem == 'Amazon') and (versioncmp($::operatingsystemrelease, '2') >= 0)
  ) {
    $enable_pamaccess_flags  = ['--enablelocauthorize', '--enablepamaccess']
    $disable_pamaccess_flags = ['--enablelocauthorize', '--disablepamaccess']
  } elsif ($facts['os']['family'] == 'Debian') and (
    (($::operatingsystem == 'Debian') and (versioncmp($::operatingsystemrelease, '7.0') >= 0)) or
    (($::operatingsystem == 'Ubuntu') and (versioncmp($::operatingsystemrelease, '10.0') >= 0))
  ) {
    $enable_pamaccess_flags  = []
    $disable_pamaccess_flags = []
  } else {
    fail("The ${module_name} module is not supported on a ${facts['os']['family']} based system with version ${::operatingsystemrelease}.")
  }

}
