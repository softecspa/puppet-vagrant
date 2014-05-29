# ==Class vagrant
#
# Install vagrant
#
# === Parameters
#
# [*version*]
#   Version to install. Ignored in ubuntu. Default: latest for ubuntu, 1.6.2 in Windows
#
# [*tmp_dir*]
#   temp dir used to download the installer. Ignored in ubuntu, mandatory in Windows
#
# === Authors
#
# Author Name Felice Pizzurro <felice.pizzurro@softecspa.it>
#
# === Copyright
#
# Copyright 2014 Softec SpA
#
class vagrant (
  $version      = '1.6.2',
  $tmp_dir      = ''
) {

  case $::operatingsystem {
    'windows':  {

      require cygwin

      if $tmp_dir == '' {
        fail('in windows tmp_dir is mandatory')
      }

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
