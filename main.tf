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

resource "aws_elasticache_cluster" "cluster" {
  cluster_id                   = var.cluster_id
  engine                       = var.engine
  node_type                    = var.node_type
  num_cache_nodes              = var.num_cache_nodes
  parameter_group_name         = var.parameter_group_name
  port                         = var.port
  apply_immediately            = var.apply_immediately
  engine_version               = var.engine_version
  transit_encryption_enabled   = var.transit_encryption_enabled
  subnet_group_name            = var.subnet_group_name
  security_group_ids           = var.security_group_ids
  maintenance_window           = var.maintenance_window
  notification_topic_arn       = var.notification_topic_arn
  az_mode                      = var.az_mode
  availability_zone            = var.availability_zone
  preferred_availability_zones = var.preferred_availability_zones
  network_type                 = var.network_type
  tags                         = var.tags
}
