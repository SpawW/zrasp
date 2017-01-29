class { 'proxy':
  zabbix_server_host => 'myzabbix.spinola.net.br',
  zabbix_server_port => '10051',
  zabbix_version => '3.2',
  database_type      => 'sqlite',
  database_name      => '/tmp/zbxproxydb',
}
