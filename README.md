# rds
A Terraform module for an RDS database with some peripheral structures

# Terraform Docs

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_subnet_group.subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_iam_role.enhanced_monitoring_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.enhanced_monitoring_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_kms_alias.encryption_key_alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.encryption_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_rds_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster) | resource |
| [aws_rds_cluster_instance.instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_instance) | resource |
| [aws_security_group.cluster_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [random_password.admin_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admitted_security_groups"></a> [admitted\_security\_groups](#input\_admitted\_security\_groups) | Security groups containing resources that should be allowed to connect to the database | `list(string)` | `[]` | no |
| <a name="input_allow_major_version_upgrade"></a> [allow\_major\_version\_upgrade](#input\_allow\_major\_version\_upgrade) | Set to true when upgrading major versions of the engine. Otherwise, set false. Defaults to false | `bool` | `false` | no |
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Set to true for all changes to be applied immediately. Otherwise, changes will be applied during the next maintenance window | `bool` | `true` | no |
| <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade) | Whether to allow the minor version of the database engine to be upgrade during maintenance windows. Upgrades incur downtime | `bool` | `false` | no |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | The number of days for which automated database backups are retained | `number` | `7` | no |
| <a name="input_cluster_identifier"></a> [cluster\_identifier](#input\_cluster\_identifier) | A prefix for the identifer of the cluster. Will be prepended to a random string to ensure a unique name | `string` | n/a | yes |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | The name of the default database created within the cluster | `string` | `"main"` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Whether or not to enable deletion protection on the cluster. Must be toggled off to delete the cluster | `bool` | `true` | no |
| <a name="input_enable_http_endpoint"></a> [enable\_http\_endpoint](#input\_enable\_http\_endpoint) | Enable HTTP endpoint. Only valid when the engine mode is 'serverless' | `bool` | `false` | no |
| <a name="input_enabled_cloudwatch_logs_exports"></a> [enabled\_cloudwatch\_logs\_exports](#input\_enabled\_cloudwatch\_logs\_exports) | Types of logs to export to Cloudwatch | `list(string)` | <pre>[<br>  "audit",<br>  "error",<br>  "general",<br>  "slowquery"<br>]</pre> | no |
| <a name="input_engine"></a> [engine](#input\_engine) | The database engine to run in the cluster (aurora, aurora-mysql, aurora-postgresql) | `string` | `"aurora-postgresql"` | no |
| <a name="input_engine_mode"></a> [engine\_mode](#input\_engine\_mode) | global, multimaster, parallelquery, provisioned, or serverless | `string` | `"provisioned"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The version of the database engine to use | `string` | `"9.6.3"` | no |
| <a name="input_enhanced_monitoring_interval"></a> [enhanced\_monitoring\_interval](#input\_enhanced\_monitoring\_interval) | The interval (in seconds) to send enhanced monitoring metrics to Cloudwatch. Set to 0 to disable enhanced monitoring | `number` | `5` | no |
| <a name="input_existing_subnet_group"></a> [existing\_subnet\_group](#input\_existing\_subnet\_group) | The name of an existing subnet group to use. If not provided, one will be created | `string` | `""` | no |
| <a name="input_iam_database_authentication_enabled"></a> [iam\_database\_authentication\_enabled](#input\_iam\_database\_authentication\_enabled) | Enable mapping of database accounts to IAM entities | `bool` | `true` | no |
| <a name="input_iam_roles"></a> [iam\_roles](#input\_iam\_roles) | IAM roles (arns) to associate with the cluster | `list(string)` | `[]` | no |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | Instance class used to create cluster instances | `string` | `"db.m6g"` | no |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | The number of instances to create within the cluster | `number` | `1` | no |
| <a name="input_performance_insights_enabled"></a> [performance\_insights\_enabled](#input\_performance\_insights\_enabled) | Whether to enable performance insights | `bool` | `true` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Required if no existing subnet group is given. A list of IDs of subnets in which to deploy the cluster | `list(string)` | `[]` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC in which to create the database | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin_password"></a> [admin\_password](#output\_admin\_password) | The initial password for the 'administrator' user within the cluster |
| <a name="output_admitted_security_groups"></a> [admitted\_security\_groups](#output\_admitted\_security\_groups) | The value provided for var.admitted\_security\_groups |
| <a name="output_allow_major_version_upgrade"></a> [allow\_major\_version\_upgrade](#output\_allow\_major\_version\_upgrade) | The value provided for var.allow\_major\_version\_upgrade |
| <a name="output_apply_immediately"></a> [apply\_immediately](#output\_apply\_immediately) | The value provided for var.apply\_immediately |
| <a name="output_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#output\_auto\_minor\_version\_upgrade) | The value provided for var.auto\_minor\_version\_upgrade |
| <a name="output_backup_retention_period"></a> [backup\_retention\_period](#output\_backup\_retention\_period) | The value provided for var.backup\_retention\_period |
| <a name="output_cluster"></a> [cluster](#output\_cluster) | The database cluster resource |
| <a name="output_cluster_identifier"></a> [cluster\_identifier](#output\_cluster\_identifier) | The value provided for var.cluster\_identifier |
| <a name="output_cluster_instances"></a> [cluster\_instances](#output\_cluster\_instances) | The database cluster instances |
| <a name="output_cluster_security_group"></a> [cluster\_security\_group](#output\_cluster\_security\_group) | The security group used by the cluster |
| <a name="output_cluster_security_group_ingress"></a> [cluster\_security\_group\_ingress](#output\_cluster\_security\_group\_ingress) | Ingress rules associated with the cluster's security group |
| <a name="output_database_name"></a> [database\_name](#output\_database\_name) | The value provided for var.database\_name |
| <a name="output_db_subnet_group"></a> [db\_subnet\_group](#output\_db\_subnet\_group) | The db subnet group created by the module, or the existing subnet group name, if provided |
| <a name="output_deletion_protection"></a> [deletion\_protection](#output\_deletion\_protection) | The value provided for var.deletion\_protection |
| <a name="output_enable_http_endpoint"></a> [enable\_http\_endpoint](#output\_enable\_http\_endpoint) | The value provided for var.enable\_http\_endpoint |
| <a name="output_enabled_cloudwatch_logs_exports"></a> [enabled\_cloudwatch\_logs\_exports](#output\_enabled\_cloudwatch\_logs\_exports) | The value provided for var.enable\_cloudwatch\_logs\_exports |
| <a name="output_encryption_key"></a> [encryption\_key](#output\_encryption\_key) | The KMS key used to encrypt the contents of the cluster |
| <a name="output_encryption_key_alias"></a> [encryption\_key\_alias](#output\_encryption\_key\_alias) | The alias of the KMS key used to encrypt the contents of the cluster |
| <a name="output_engine"></a> [engine](#output\_engine) | The value provided for var.engine |
| <a name="output_engine_mode"></a> [engine\_mode](#output\_engine\_mode) | The value provided for var.engine\_mode |
| <a name="output_engine_version"></a> [engine\_version](#output\_engine\_version) | The value provided for var.engine\_version |
| <a name="output_enhanced_monitoring_interval"></a> [enhanced\_monitoring\_interval](#output\_enhanced\_monitoring\_interval) | The value provided for var.enhanced\_monitoring\_interval |
| <a name="output_enhanced_monitoring_role"></a> [enhanced\_monitoring\_role](#output\_enhanced\_monitoring\_role) | The role created to export enhanced monitoring metrics to Cloudwatch, if enabled |
| <a name="output_enhanced_monitoring_role_policy_attachment"></a> [enhanced\_monitoring\_role\_policy\_attachment](#output\_enhanced\_monitoring\_role\_policy\_attachment) | The attachment of the enhanced monitoring policy to the enhanced monitoring role |
| <a name="output_existing_subnet_group"></a> [existing\_subnet\_group](#output\_existing\_subnet\_group) | The value provided for var.existing\_subnet\_group |
| <a name="output_iam_database_authentication_enabled"></a> [iam\_database\_authentication\_enabled](#output\_iam\_database\_authentication\_enabled) | The value provided for var.iam\_database\_authentication\_enabled |
| <a name="output_iam_roles"></a> [iam\_roles](#output\_iam\_roles) | The value provided for var.iam\_roles |
| <a name="output_instance_class"></a> [instance\_class](#output\_instance\_class) | The value provided for var.instance\_class |
| <a name="output_instance_count"></a> [instance\_count](#output\_instance\_count) | The value provided for var.instance\_count |
| <a name="output_performance_insights_enabled"></a> [performance\_insights\_enabled](#output\_performance\_insights\_enabled) | The value provided for var.performance\_insights\_enabled |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | The value provided for var.subnets |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The value provided for var.vpc\_id |
