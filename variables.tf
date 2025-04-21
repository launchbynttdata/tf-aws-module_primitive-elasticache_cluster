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

variable "cluster_id" {
  type        = string
  description = "(Required) Group identifier. ElastiCache converts this name to lowercase. Changing this value will re-create the resource."
}

variable "engine" {
  type        = string
  default     = "memcached"
  description = "(Optional, Required if replication_group_id is not specified) Name of the cache engine to be used for this cache cluster."
  validation {
    condition     = contains(["memcached", "redis"], var.engine)
    error_message = "engine should have a valid value."
  }
}

variable "node_type" {
  type        = string
  default     = null
  description = "(Required unless replication_group_id is provided) The instance class used."
}

variable "num_cache_nodes" {
  type        = number
  default     = null
  description = "(Required unless replication_group_id is provided) The initial number of cache nodes that the cache cluster will have."
}

variable "parameter_group_name" {
  type        = string
  default     = null
  description = "(Required unless replication_group_id is provided) The name of the parameter group to associate with this cache cluster."
}

variable "port" {
  type        = number
  default     = 11211
  description = "(Optional) The port number on which each of the cache nodes will accept connections."
}

variable "apply_immediately" {
  type        = bool
  description = "(Optional) Whether any database modifications are applied immediately, or during the next maintenance window."
  default     = false
}

variable "engine_version" {
  type        = string
  description = "(Optional) Version number of the cache engine to be used. If not set, defaults to the latest version."
  default     = null
}

variable "transit_encryption_enabled" {
  type        = string
  description = "(Optional) Enable encryption in-transit."
  default     = null
}

variable "subnet_group_name" {
  type        = string
  description = "(Optional, VPC only) Name of the subnet group to be used for the cache cluster."
  default     = null
}

variable "security_group_ids" {
  type        = list(string)
  description = "(Optional, VPC only) One or more VPC security groups associated with the cache cluster."
  default     = null
}

variable "maintenance_window" {
  type        = string
  description = "(Optional) Specifies the weekly time range for when maintenance on the cache cluster is performed."
  default     = null
}

variable "notification_topic_arn" {
  type        = string
  description = "(Optional) ARN of an SNS topic to send ElastiCache notifications to."
  default     = null
}

variable "az_mode" {
  type        = string
  description = "(Optional, Memcached only) Whether the nodes in this Memcached node group are created in a single Availability Zone or created across multiple Availability Zones in the cluster's region."
  default     = null
}

variable "availability_zone" {
  type        = string
  description = "(Optional) Availability Zone for the cache cluster."
  default     = null
}

variable "preferred_availability_zones" {
  type        = list(string)
  description = "(Optional, Memcached only) List of the Availability Zones in which cache nodes are created."
  default     = null
}

variable "network_type" {
  type        = string
  description = "(Optional) The IP versions for cache cluster connections."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) Map of tags to assign to the resource."
  default     = null
}
