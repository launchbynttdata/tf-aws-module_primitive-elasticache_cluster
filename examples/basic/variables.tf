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

variable "engine" {
  type        = string
  default     = "memcached"
  description = "Name of the cache engine to be used for this cache cluster."
  validation {
    condition     = contains(["memcached", "redis"], var.engine)
    error_message = "engine should have a valid value."
  }
}

variable "node_type" {
  type        = string
  description = "The instance class used."
}

variable "num_cache_nodes" {
  type        = number
  default     = 1
  description = "The initial number of cache nodes that the cache cluster will have."
  validation {
    condition     = var.num_cache_nodes >= 1
    error_message = "num_cache_nodes should be greather or equal than 1."
  }
}

variable "parameter_group_name" {
  type        = string
  description = "The name of the parameter group to associate with this cache cluster."
}

variable "port" {
  type        = number
  default     = 11211
  description = "(Optional) The port number on which each of the cache nodes will accept connections."
}
