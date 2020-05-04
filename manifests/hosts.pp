# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include system::hosts
class system::hosts {

  resources { 'host':
    purge => true,
  }

  host { 'gitlab.classroom.puppet.com':
    ensure       => 'present',
    host_aliases => ['gitlab', 'gitlab.puppet.vm'],
    ip           => '10.110.0.98',
  }

  host { 'localhost':
    ensure       => 'present',
    host_aliases => ['localhost.localdomain', 'localhost4', 'localhost4.localdomain4'],
    ip           => '127.0.0.1',
  }

  host { 'puppet.classroom.puppet.com':
    ensure       => 'present',
    host_aliases => ['puppet'],
    ip           => '10.110.0.131',
  }

}
