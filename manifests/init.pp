class vagrant (
  $version      = '1.6.2',
  $tmp_dir      = 'C:\\vagrant-init\\tmp'
) {
  
  case $::operatingsystem {
    "windows":  {
      $source           = "https://dl.bintray.com/mitchellh/vagrant/vagrant_${version}.msi"
      $filename         = "${tmp_dir}\\vagrant_${version}.msi"
      $provider         = "windows"
      $install_options  = [ "--silent" ]


      cygwin::wget {$source:
        path    => $filename,
        before  => Package["Vagrant"],
      }
    }
  }

  package {"Vagrant":
    ensure          => installed,
    source          => $filename,
    provider        => $provider,
  }

}
