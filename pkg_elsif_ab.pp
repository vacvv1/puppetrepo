class package_installation {

   if $::osfamily =='ReHat'{
      $pkgname = [ 'screen', 'strace', 'sudo' ]
}
   elsif $::osfamily == 'Debian'{
     $pkgname = [ 'screen', 'trace', 'sudo' ]
        } else {
     $pkgname = [ 'screen' ]
     }

   package { $pkgname:  
     ensure => absent,
         }
}
include package_installation
