# Adail Horst <adail@spinola.net.br>
#
# === Copyright
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class proxy::deploy inherits piproxy {

  package { 'wget':
    ensure => present,
  }
  package { 'fping':
    ensure => present,
  }

  remote_file {'/usr/local/bin/zabbix_get':
    remote_location => "https://github.com/SpawW/zrasp/raw/master/${$zabbix_version}/bin/zabbix_get"
    mode            => '0644',
    owner           => 'zabbix',
    group           => 'zabbix',
  }

  remote_file {'/usr/local/bin/zabbix_sender':
    remote_location => "https://github.com/SpawW/zrasp/raw/master/${$zabbix_version}/bin/zabbix_sender"
    mode            => '0644',
    owner           => 'zabbix',
    group           => 'zabbix',
  }

  remote_file {'/usr/local/sbin/zabbix_agentd':
    remote_location => "https://github.com/SpawW/zrasp/raw/master/${$zabbix_version}/bin/zabbix_agentd"
    mode            => '0644',
    owner           => 'zabbix',
    group           => 'zabbix',
  }

  remote_file {'/usr/local/sbin/zabbix_proxy':
    remote_location => "https://github.com/SpawW/zrasp/raw/master/${$zabbix_version}/bin/zabbix_proxy"
    mode            => '0644',
    owner           => 'zabbix',
    group           => 'zabbix',
  }

  remote_file {'/var/lib/sqlite/zabbixProxy.db':
    remote_location => "https://github.com/SpawW/zrasp/raw/master/${$zabbix_version}/db/zabbix3.2.db"
    mode            => '0755',
    owner   => 'zabbix',
    group   => 'zabbix',
  }
}