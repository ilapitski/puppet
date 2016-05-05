File { backup => false }

node default {
  notify { "${::environment} puppet environment": }
}

node puppet-node02 {
  include nginx 
  class { '::mysql::server':
    root_password    => 'password',
    override_options => {
      'mysqld' => { 'max_connections' => '1024' }
    },
  }
  mysql_database { 'prod_mdb':
      ensure  => present,
      charset => 'utf8',
  }
  mysql_user { 'prod_user@localhost':
    ensure => present,
  }
  mysql_grant { 'prod_user@localhost/prod_mdb.*':
    ensure      => present,
    options     => ['GRANT'],
    privileges  => ['ALL'],
    table       => 'prod_mdb.*',
    user        => 'prod_user@localhost',
  }  
}
