# with_cake

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.14 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | 3.7.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_elasticache_cluster"></a> [elasticache\_cluster](#module\_elasticache\_cluster) | ../.. | n/a |

## Resources

| Name | Type |
|------|------|
| [random_string.cluster_id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_engine"></a> [engine](#input\_engine) | (Optional, Required if replication\_group\_id is not specified) Name of the cache engine to be used for this cache cluster. | `string` | `"memcached"` | no |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | (Required unless replication\_group\_id is provided) The instance class used. | `string` | `null` | no |
| <a name="input_num_cache_nodes"></a> [num\_cache\_nodes](#input\_num\_cache\_nodes) | (Required unless replication\_group\_id is provided) The initial number of cache nodes that the cache cluster will have. | `number` | `null` | no |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | (Required unless replication\_group\_id is provided) The name of the parameter group to associate with this cache cluster. | `string` | `null` | no |
| <a name="input_port"></a> [port](#input\_port) | (Optional) The port number on which each of the cache nodes will accept connections. | `number` | `11211` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_elasticache_cluster_id"></a> [elasticache\_cluster\_id](#output\_elasticache\_cluster\_id) | n/a |
| <a name="output_elasticache_cluster_arn"></a> [elasticache\_cluster\_arn](#output\_elasticache\_cluster\_arn) | n/a |
| <a name="output_elasticache_cluster_engine"></a> [elasticache\_cluster\_engine](#output\_elasticache\_cluster\_engine) | n/a |
| <a name="output_elasticache_cluster_node_type"></a> [elasticache\_cluster\_node\_type](#output\_elasticache\_cluster\_node\_type) | n/a |
| <a name="output_elasticache_cluster_num_cache_nodes"></a> [elasticache\_cluster\_num\_cache\_nodes](#output\_elasticache\_cluster\_num\_cache\_nodes) | n/a |
| <a name="output_elasticache_cluster_parameter_group_name"></a> [elasticache\_cluster\_parameter\_group\_name](#output\_elasticache\_cluster\_parameter\_group\_name) | n/a |
| <a name="output_elasticache_cluster_port"></a> [elasticache\_cluster\_port](#output\_elasticache\_cluster\_port) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
