class vagrant (
  $version      = '1.6.2',
  $tmp_dir      = 'C:\\vagrant-init\\tmp'
) {
  
  case $::operatingsystem {
    'windows':  {
      $source           = "https://dl.bintray.com/mitchellh/vagrant/vagrant_${version}.msi"
      $filename         = "${tmp_dir}\\vagrant_${version}.msi"
      $provider         = 'windows'
      $install_options  = [ '--silent' ]
      $pkg_name         = 'Vagrant'
      $ensure           = 'installed'


      cygwin::wget {$source:
        path    => $filename,
        before  => Package["Vagrant"],
      }
    }
    'ubuntu': {
      $filename = undef
      $ensure   = 'latest'
      $provider = 'apt'
      $pkg_name = 'vagrant'
    }
  }

  package {$pkg_name:
    ensure          => $ensure,
    source          => $filename,
    provider        => $provider,
  }

}
