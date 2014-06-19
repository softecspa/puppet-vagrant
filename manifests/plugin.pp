define vagrant::plugin (
  $plugin = '',
  $home   = '',
) {
  
  $plugin_name = $plugin? {
    ''      => $name,
    default => $plugin
  }

  case $::operatingsystem {
    'ubuntu': {
      $install_command="vagrant plugin install $plugin_name"
      $unless="vagrant plugin list | grep '$plugin_name'"
      $provider=undef

      $env_librarian = $home? {
        ''      => undef,
        default => ["HOME=$home"]
      }
    }
    'windows': {
      $install_command="vagrant plugin install $plugin_name"
      $unless="[bool](vagrant plugin list | Select-String '$plugin_name')"
      $provider=powershell

      $env_librarian = undef
    }
  }

  exec {"install vagrant plugin $plugin_name":
    command     => $install_command,
    unless      => $unless,
    provider    => $provider,
    path        => $::path,
    environment => $env_librarian
  }

}
