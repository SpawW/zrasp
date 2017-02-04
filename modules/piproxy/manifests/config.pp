# Adail Horst <adail@spinola.net.br>
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
    notify  => Service['zabbix-proxy'],
  }
  file { '/var/lib/sqlite/':
    ensure => directory,
  }

}
