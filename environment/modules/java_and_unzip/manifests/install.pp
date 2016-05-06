class java_and_unzip::install {
 
   notify {"Notification":
     message => "Hello from jboss_task",
     #before => Package['java-1.6.0-openjdk.x86_64'],
   }

   package { 'java-1.6.0-openjdk.x86_64':
     ensure => 'installed',
     before => Package['unzip'],
   }
   
   package { 'unzip':
     ensure => 'installed',
     before => Class['jboss::install'],
   } 
} 
