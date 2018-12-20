class pkgs_install
{
 if $::osfamily == 'RedHat'
 {
 $pkgs_list = [
   'binutils',
   'compat-db',
   'gcc',
   'openmotif*'
       ]
 package { $pkgs_list:
    ensure => latest,
       }
 }
}
include pkgs_install
