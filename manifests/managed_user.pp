# @summary A short summary of the purpose of this defined type.
#
# A description of what this defined type does
#
# @example
#   system::managed_user { 'namevar': }
define system::managed_user (
  $password = '$1$nHIWId6g$xt6zukun5t4aB0OM758O21',
) {
  user { $title:
    ensure   => present,
    password => $password,
  }

  if $facts['kernel'] == 'Linux' {
    $homedir = "/home/${title}"

    file { $homedir:
      ensure => directory,
      owner  => $title,
    }

    file { "${homedir}/.bashrc":
      ensure => file,
      owner  => $title,
      source => 'puppet:///modules/system/bashrc',
    }
  }
}
