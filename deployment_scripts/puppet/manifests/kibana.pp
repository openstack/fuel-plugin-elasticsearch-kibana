#    Copyright 2015 Mirantis, Inc.
#
#    Licensed under the Apache License, Version 2.0 (the "License"); you may
#    not use this file except in compliance with the License. You may obtain
#    a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#    License for the specific language governing permissions and limitations
#    under the License.
#
prepare_network_config(hiera('network_scheme', {}))
$mgmt_address = get_network_role_property('management', 'ipaddr')
$elasticsearch_kibana = hiera('elasticsearch_kibana')
$network_metadata = hiera('network_metadata')
$es_nodes = get_nodes_hash_by_roles($network_metadata, ['elasticsearch_kibana'])

if is_integer($elasticsearch_kibana['number_of_replicas']) and $elasticsearch_kibana['number_of_replicas'] < count($es_nodes) {
  $number_of_replicas = 0 + $elasticsearch_kibana['number_of_replicas']
}else{
  # Override the replication number otherwise this will lead to a stale cluster health
  $number_of_replicas = count($es_nodes) - 1
}

class { 'lma_logging_analytics::kibana':
  number_of_replicas => $number_of_replicas,
  es_host            => $mgmt_address,
}
