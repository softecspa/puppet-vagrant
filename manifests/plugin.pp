define vagrant::plugin (
  $plugin = '',
) {
  
  $plugin_name = $plugin? {
    ''      => $name,
    default => $plugin
  }

  case $::operatingsystem {
    'ubuntu': {
      $install_command="vagrant plugin install $plugin_name"
      $unless="vagrant plugin list | grep '$plugin_name'"
    }
    'windows': {
      $install_command="vagrant plugin install $plugin_name"
      $unless="[bool](vagrant plugin list | Select-String '$plugin_name')"
    }
  }

  exec {"install vagrant plugin $plugin_name":
    command => $install_command,
    unless  => $unless
  }

}
