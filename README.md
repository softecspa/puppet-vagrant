vagrant
=================

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with [Modulename]](#setup)
 * [Setup requirements](#setup-requirements)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Limitations - OS compatibility, etc.](#limitations)

##Overview
This module manage installation of vagrant. It work and it's tested on:
 * Windows 7 (x86/x64)
 * Ubuntu 12.04 (but it should work in 10.04 and earlier)

##Module Description
 * In a windows environment this module:
    * download the installation file in a tmp\_dir and, after, it installs it
 * in a linux environment it use the package resource. Last version present in ubuntu repository will be installed

##Setup

 * in windows parameter *tmp_dir* is mandatory:
    * *class{'vagrant': tmp_dir => "C:\\tmp_path"}*
 * in Ubuntu
    * *include vagrant*

###Setup Requirements
in windows it require modules:
 * softecspa/puppetlabs-powershell

In Ubuntu no dependencies are present

##Usage
Option parameter version should be used to specify a version of package to install. **This parameter will be evalueted only in Windows**, in ubuntu it will be ignored and latest version will be installed.

## Limitations
**In Windows versions different from 1.6.2 are not tested!**
