class proxy::user inherits proxy {

  group { 'zabbix':
    ensure => 'present',
  }
  user { 'zabbix':
    home             => '/home/zabbix',
    password         => '!!@!!d',
    password_max_age => '99999',
    password_min_age => '0',
    shell            => '/bin/false',
  }
}

