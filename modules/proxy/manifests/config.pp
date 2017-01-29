# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class proxy::config inherits proxy {
  file { '/usr/local/etc/zabbix_proxy.conf':
    ensure  => present,
    owner   => 'zabbix',
    group   => 'zabbix',
    mode    => '0644',
    replace => true,
    content => template('proxy/zabbix.proxy.conf.erb'),
  }
  file { '/var/lib/sqlite/':
    ensure => directory,
  }
  package { 'wget':
     ensure => installed,
  }
  package { 'fping':
     ensure => present,
  }
  # Download sqlitedb
  #https://github.com/SpawW/zrasp/raw/master/3.2/db/zabbix3.2.db
  remote_file {'/var/lib/sqlite/zabbixProxy.db':
     remote_location => 'https://github.com/SpawW/zrasp/raw/master/3.2/db/zabbix3.2.db',
     mode            => '0755',
    owner   => 'zabbix',
    group   => 'zabbix',
  }

}
