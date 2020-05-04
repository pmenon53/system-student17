# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include system::aliases
class system::aliases (
  Optional[String] $admin = undef,
) {
  file { '/etc/aliases':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => epp('system/aliases.epp', { admin => $admin }),
  }
}
