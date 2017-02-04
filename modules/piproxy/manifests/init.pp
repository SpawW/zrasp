# == Class: piproxy
#
# Full description of class piproxy here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'piproxy':
#  }
#
# === Authors
#
# Adail Horst <adail@spinola.net.br>
#
# === Copyright
#
# Copyright 2017 Your name here, unless otherwise noted.
#

define remote_file($remote_location=undef, $mode='0644', $owner = 'zabbix', $group = 'zabbix'){
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

class piproxy ($zabbix_server_host = 'zabbix3.spinola.net.br', $zabbix_server_port = '8080'
, $database_type = 'sqlite', $zabbix_version = "3.2" , $database_name = '/var/lib/sqlite/zabbixProxy.db', $mode = 0) {
  include piproxy::deploy
  include piproxy::config
}
