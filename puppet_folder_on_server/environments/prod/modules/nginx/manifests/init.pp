class nginx {
   yumrepo { 'nginx':
       baseurl  => "http://nginx.org/packages/centos/6/\$basearch/",
       descr    => 'nginx repo',
       enabled  => '1',
       gpgcheck => '0',
       before   => Package['nginx'],
       }
   package { 'nginx':
       ensure => 'installed',
       }
   service { 'nginx':
       ensure => 'running',
       require => Package['nginx'],
       }
} 
