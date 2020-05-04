# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include system::admins
class system::admins {
  require mysql::server

  $users = {
    'zack'   => {
      ensure               => present,
      max_queries_per_hour => 1200,
    },
    'monica' => {
      ensure               => present,
      max_queries_per_hour => 600,
    },
    'brad'   => {
      ensure               => present,
      max_queries_per_hour => 600,
    },
    'luke'   => {
      ensure               => present,
      max_queries_per_hour => 600,
    },
    'ralph'  => {
      ensure               => absent,
    }
  }

  $users.each |String $user, Hash $attributes| {
    user { $user:
      ensure => $attributes['ensure'],
    }

    mysql_user { "${user}@localhost":
      * => $attributes,
    }
  }
}
