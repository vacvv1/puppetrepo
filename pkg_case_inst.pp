# using case to install package
class package_installation {

   case $::osfamily {
        'RedHat': {
           $pkgname = [ 'screen', 'strace', 'sudo' ]
        }
        'Debian': {
           $pkgname = [ 'screen', 'strace', 'sudo' ]
        }
        default: {
          $pkgname = [ 'screen' ]
    	}
   }

package { $pkgname:
   ensure => present,
       }
}
include package_installation
