
define remote_file($remote_location=undef, $mode='0644', $owner = 'zabbix', $group = 'zabbix') {
  exec{"retrieve_${title}":
    command => "/usr/bin/wget -q ${remote_location} -O ${title}",
    creates => $title,
  }

  file{$title:
    mode    => $mode,
    owner   => $owner,
    group   => $group,
    require => Exec["retrieve_${title}"],
  }
}

class raspctl ($uuid = 'define') {
  file { '/etc/raspctl/dynamic-dns.conf':
    ensure  => present,
    replace => true,
    content => template('raspctl/dynamic-dns.conf.erb'),
  }
}
