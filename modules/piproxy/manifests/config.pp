# Adail Horst <adail@spinola.net.br>
#
# === Copyright
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class piproxy::config inherits piproxy {
  file { '/usr/local/etc/zabbix_proxy.conf':
    ensure  => present,
    owner   => 'zabbix',
    group   => 'zabbix',
    mode    => '0644',
    replace => true,
    content => template('piproxy/zabbix.proxy.conf.erb'),
    notify  => Service['zabbix-proxy'],
  }
  file { '/usr/local/etc/zabbix_agentd.conf':
    ensure  => present,
    owner   => 'zabbix',
    group   => 'zabbix',
    mode    => '0644',
    replace => true,
    content => template('piproxy/zabbix.agentd.conf.erb'),
    notify  => Service['zabbix-proxy'],
  }
  file { '/usr/local/etc/zabbix_agentd.conf.d':
    ensure => directory,
    owner   => 'zabbix',
    group   => 'zabbix',
  }
  file { '/usr/local/etc/zabbix_proxy.conf.d':
    ensure => directory,
    owner   => 'zabbix',
    group   => 'zabbix',
  }
  # Configuracao do banco de dados do proxy ------------------------------------
  file { '/var/lib/sqlite/':
    ensure => directory,
  }

  remote_file {'/var/lib/sqlite/zabbixProxy.db':
    remote_location => "https://github.com/SpawW/zrasp/raw/master/${$zabbix_version}/db/zabbix3.2.db",
    mode            => '0755',
    owner   => 'zabbix',
    group   => 'zabbix',
  }

}
