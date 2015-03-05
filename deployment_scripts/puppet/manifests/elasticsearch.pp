$fuel_settings = parseyaml(file('/etc/astute.yaml'))

# Params related to Elasticsearch.
$es_dir      = $fuel_settings['elasticsearch_kibana']['data_dir'],
$es_instance = "es-01"
$java        = "openjdk-7-jre-headless"

# Ensure that java is installed
package { $java:
  ensure => installed,
}

# Install elasticsearch
class { "elasticsearch":
  datadir => ["${es_dir}/elasticsearch_data"],
  require => [Package[$java]],
}

# Start an instance of elasticsearch
elasticsearch::instance { $es_instance: }
