
File { backup => false }

node default {
  notify { "This is ${::fqdn}, running the ${::operatingsystem} operating system": }
}

node "pserver"{
 class { 'ntp':
  servers => [
  '1.by.pool.ntp.org',
  '1.europe.pool.ntp.org',
  '3.europe.pool.ntp.org'
  ]
} 
}

node "pnode01" {
  class { 'ntp':
  servers => [
    '1.by.pool.ntp.org',
    '1.europe.pool.ntp.org',
    '3.europe.pool.ntp.org'
  ]
  }  
  class { '::mysql::server':
    root_password    => 'password',
    override_options => {
      'mysqld' => { 'max_connections' => '1024' }
    },
  }
  mysql_database { 'test_db':
      ensure  => present,
      charset => 'utf8',
  }
  mysql_user { 'test_user@localhost':
    ensure => present,
  }
  mysql_grant { 'test_user@localhost/test_db.*':
    ensure      => present,
    options     => ['GRANT'],
    privileges  => ['ALL'],
    table       => 'test_db.*',
    user        => 'test_user@localhost',
  } 
}
