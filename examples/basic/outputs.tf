// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

output "elasticache_cluster_id" {
  value = module.elasticache_cluster.elasticache_cluster_id
}

output "elasticache_cluster_arn" {
  value = module.elasticache_cluster.elasticache_cluster_arn
}

output "elasticache_cluster_engine" {
  value = module.elasticache_cluster.elasticache_cluster_engine
}
output "elasticache_cluster_node_type" {
  value = module.elasticache_cluster.elasticache_cluster_node_type
}
output "elasticache_cluster_num_cache_nodes" {
  value = module.elasticache_cluster.elasticache_cluster_num_cache_nodes
}
output "elasticache_cluster_parameter_group_name" {
  value = module.elasticache_cluster.elasticache_cluster_parameter_group_name
}
output "elasticache_cluster_port" {
  value = module.elasticache_cluster.elasticache_cluster_port
}
