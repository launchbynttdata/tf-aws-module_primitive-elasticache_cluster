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
