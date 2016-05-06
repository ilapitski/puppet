define remote_file::file(
    $remote_location=undef, 
    $mode='0644', 
    $owner='root',
    $group='root'
  ){
  exec{"retrieve_${title}":
    command => "/usr/bin/wget -q ${remote_location} -O ${title}",
    creates => $title,
  }
  file{$title:
    mode    => $mode,
    owner   => $owner,
    group   => $group,
    ensure  => file,
    require => Exec["retrieve_${title}"],
  }
 }
