# tf-aws-module_primitive-elasticache_cluster

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![License: CC BY-NC-ND 4.0](https://img.shields.io/badge/License-CC_BY--NC--ND_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-nd/4.0/)

## Overview

This primitive module creates an AWS ElastiCache cluster (`aws_elasticache_cluster`) for Memcached or Redis. It exposes a thin, low-opinion interface for cluster identity, engine, node type, node count, networking, encryption in transit, maintenance, and tags. Use it when you need a standalone cache cluster rather than a Redis replication group.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.100 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_elasticache_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | (Optional) Whether any database modifications are applied immediately, or during the next maintenance window. | `bool` | `false` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | (Optional) Availability Zone for the cache cluster. | `string` | `null` | no |
| <a name="input_az_mode"></a> [az\_mode](#input\_az\_mode) | (Optional, Memcached only) Whether the nodes in this Memcached node group are created in a single Availability Zone or created across multiple Availability Zones in the cluster's region. | `string` | `null` | no |
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | (Required) Group identifier. ElastiCache converts this name to lowercase. Changing this value will re-create the resource. | `string` | n/a | yes |
| <a name="input_engine"></a> [engine](#input\_engine) | (Optional, Required if replication\_group\_id is not specified) Name of the cache engine to be used for this cache cluster. | `string` | `"memcached"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | (Optional) Version number of the cache engine to be used. If not set, defaults to the latest version. | `string` | `null` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | (Optional) Specifies the weekly time range for when maintenance on the cache cluster is performed. | `string` | `null` | no |
| <a name="input_network_type"></a> [network\_type](#input\_network\_type) | (Optional) The IP versions for cache cluster connections. | `string` | `null` | no |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | (Required unless replication\_group\_id is provided) The instance class used. | `string` | `null` | no |
| <a name="input_notification_topic_arn"></a> [notification\_topic\_arn](#input\_notification\_topic\_arn) | (Optional) ARN of an SNS topic to send ElastiCache notifications to. | `string` | `null` | no |
| <a name="input_num_cache_nodes"></a> [num\_cache\_nodes](#input\_num\_cache\_nodes) | (Required unless replication\_group\_id is provided) The initial number of cache nodes that the cache cluster will have. | `number` | `null` | no |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | (Required unless replication\_group\_id is provided) The name of the parameter group to associate with this cache cluster. | `string` | `null` | no |
| <a name="input_port"></a> [port](#input\_port) | (Optional) The port number on which each of the cache nodes will accept connections. | `number` | `11211` | no |
| <a name="input_preferred_availability_zones"></a> [preferred\_availability\_zones](#input\_preferred\_availability\_zones) | (Optional, Memcached only) List of the Availability Zones in which cache nodes are created. | `list(string)` | `null` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | (Optional, VPC only) One or more VPC security groups associated with the cache cluster. | `list(string)` | `null` | no |
| <a name="input_subnet_group_name"></a> [subnet\_group\_name](#input\_subnet\_group\_name) | (Optional, VPC only) Name of the subnet group to be used for the cache cluster. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Map of tags to assign to the resource. | `map(string)` | `null` | no |
| <a name="input_transit_encryption_enabled"></a> [transit\_encryption\_enabled](#input\_transit\_encryption\_enabled) | (Optional) Enable encryption in-transit. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_elasticache_cluster_arn"></a> [elasticache\_cluster\_arn](#output\_elasticache\_cluster\_arn) | n/a |
| <a name="output_elasticache_cluster_engine"></a> [elasticache\_cluster\_engine](#output\_elasticache\_cluster\_engine) | n/a |
| <a name="output_elasticache_cluster_id"></a> [elasticache\_cluster\_id](#output\_elasticache\_cluster\_id) | n/a |
| <a name="output_elasticache_cluster_node_type"></a> [elasticache\_cluster\_node\_type](#output\_elasticache\_cluster\_node\_type) | n/a |
| <a name="output_elasticache_cluster_num_cache_nodes"></a> [elasticache\_cluster\_num\_cache\_nodes](#output\_elasticache\_cluster\_num\_cache\_nodes) | n/a |
| <a name="output_elasticache_cluster_parameter_group_name"></a> [elasticache\_cluster\_parameter\_group\_name](#output\_elasticache\_cluster\_parameter\_group\_name) | n/a |
| <a name="output_elasticache_cluster_port"></a> [elasticache\_cluster\_port](#output\_elasticache\_cluster\_port) | n/a |
<!-- END_TF_DOCS -->

## Module Development

### Pre-Requisites

The following commands should be available on your system:

- `asdf` or `mise`
- `make`
- `python3` (for pre-commit)

Additionally, your `git` user and email must be configured. Run the `make configure` command from the root of the repository to ensure that you meet these requirements.

### Pre-Commit hooks

The [.pre-commit-config.yaml](.pre-commit-config.yaml) file defines certain `pre-commit` hooks that are relevant to Terraform and Golang, as well as some common linting tasks. These will be configured for you when you run `make configure`.

### Local Validation

You should validate the changes you make to any module locally, prior to pushing your changes in a branch to GitHub.

1. Ensure that you have run `make configure` successfully.

2. Ensure you are signed into the appropriate cloud provider (e.g. AWS or Azure) for the module under test in your current console session.

3. Run the Terraform and Golang linters with the following command:

```
make lint
```

4. Once you have satisfied the linters, the following command will build example infrastructure in your configured cloud, run the tests, and then tear down the infrastructure it created:

```
make test
```

The pre-commit validations, as well as the `make lint` and `make test` targets, will all be performed in CI. Running these validations locally prior to opening a PR helps ensure a smooth review and merge process.

### Review & Merge Process

Once your change has been tested locally and your branch pushed up, open a new Pull Request for your branch to the default (main) branch of this repository.

The title of your Pull Request will determine the version bump for this change, and the title must be in [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/#specification) format in order to merge. A breaking change will trigger a major version bump, a feature will trigger a minor version bump, and all other types will trigger a patch version bump.

Ensure your CI workflows are passing; seek approval from teammates and address any feedback; seek any explicit approvals required by the CODEOWNERS file. You may merge the PR as soon as all requirements are met, and a new release and tag will be automatically created for you.

### Automatic Updates

The shared configuration and workflow files in this repository are largely managed through the [launch-terraform-skeleton](https://github.com/launchbynttdata/launch-terraform-skeleton) repository. Outside of perhaps the `.gitignore` to account for specific files being generated by certain Terraform modules (e.g. Lambda functions), there should not be much cause to update these files on a per-repo basis, and making changes to them individually is discouraged.

If desired, you can check for and run these updates locally in a branch if you have the `copier` tool installed. Some example commands are included below:

```
# Check for updates, optionally checking prerelease versions
copier check-update [--prereleases]

# Run an update, using default answers if there are any. We use tasks, which requires --trust to be set.
copier update --defaults --trust [--prereleases]

# Recopy from the source, and --overwrite all templated files in the process
copier recopy --defaults --trust --overwrite [--prereleases]
```

Automatic updates will run through a scheduled workflow, and if the post-update tests are successful, the Pull Request created will automatically merge. Conflicts in the update or failures to test may leave a Pull Request outstanding, which needs to be addressed by a Launch Engineer.
