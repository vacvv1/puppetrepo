# installing packages with dependencies using puppet
# puppet does parallel processing hence to overcome that we are creating dependencies using require and before
# either require or before should be used

#  291  sudo yum install tomcat
#  292  vi /usr/share/tomcat/conf/tomcat.conf
#  293  yum install tomcat-webapps tomcat-admin-webapps  -y
#  294  cd /usr/share/tomcat/webapps/
#  295  ls -1
#  296  yum install tomcat-docs-webapp tomcat-javadoc -y
#  297  vi /usr/share/tomcat/conf/tomcat-users.xml
#  298  systemctl start tomcat
#  299  systemctl restart tomcat
#  300  systemctl enable tomcat
#  301  ip addr
#  302  systemctl status tomcat
#  306  systemctl status tomcat
#  307  netstat -an | grep 8080
#  308  ps -ef|grep -i tomcat
#  309  cd /usr/share/tomcat/conf/
#  310  cp tomcat-users.xml /var/tmp/cp_tomcat-users.xml
#  311  cat /var/tmp/cp_tomcat-users.xml 
#  312  cp /usr/share/tomcat/conf/tomcat.conf /var/tmp/cp_tomcat.conf


# uninstall the packages related to tomcat
# below is the puppet code for tomcat installation 


class pkg_dep {
   $pkg = [ 'tomcat', 'tomcat-webapps', 'tomcat-admin-webapps', 'tomcat-javadoc', 'tomcat-docs-webapp' ]  # installing the pkg in parallel
     package { $pkg:
       ensure => present,
   }
   file { "/usr/share/tomcat/conf/tomcat-users.xml":
     ensure => present,
     source => 'puppet:///var/tmp/cp_tomcat-users.xml',  # we are overwriting the .xml file 
     owner => tomcat,
     group => tomcat,
   }
   file { '/usr/share/tomcat/conf/tomcat.conf':
      ensure => present,
      source => 'puppet:///var/tmp/cp_tomcat.conf',
      owner => tomcat,
      group => tomcat,
   }

   
	
}
include pkg_dep

# vi /usr/share/tomcat/conf/tomcat-users.xml
# vi /usr/share/tomcat/conf/tomcat.conf
###################################
