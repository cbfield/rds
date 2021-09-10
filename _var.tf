variable "admitted_security_groups" {
  description = "Security groups containing resources that should be allowed to connect to the database"
  type        = list(string)
  default     = []
}

variable "allow_major_version_upgrade" {
  description = "Set to true when upgrading major versions of the engine. Otherwise, set false. Defaults to false"
  type        = bool
  default     = false
}

variable "apply_immediately" {
  description = "Set to true for all changes to be applied immediately. Otherwise, changes will be applied during the next maintenance window"
  type        = bool
  default     = true
}

variable "auto_minor_version_upgrade" {
  description = "Whether to allow the minor version of the database engine to be upgrade during maintenance windows. Upgrades incur downtime"
  type        = bool
  default     = false
}

variable "backup_retention_period" {
  description = "The number of days for which automated database backups are retained"
  type        = number
  default     = 7
}

variable "cluster_identifier" {
  description = "A prefix for the identifer of the cluster. Will be prepended to a random string to ensure a unique name"
  type        = string
}

variable "database_name" {
  description = "The name of the default database created within the cluster"
  type        = string
  default     = "main"
}

variable "deletion_protection" {
  description = "Whether or not to enable deletion protection on the cluster. Must be toggled off to delete the cluster"
  type        = bool
  default     = true
}

variable "enable_http_endpoint" {
  description = "Enable HTTP endpoint. Only valid when the engine mode is 'serverless'"
  type        = bool
  default     = false
}

variable "enabled_cloudwatch_logs_exports" {
  description = "Types of logs to export to Cloudwatch"
  type        = list(string)
  default     = ["audit", "error", "general", "slowquery"]
}

variable "engine" {
  description = "The database engine to run in the cluster (aurora, aurora-mysql, aurora-postgresql)"
  type        = string
  default     = "aurora-postgresql"
}

variable "engine_mode" {
  description = "global, multimaster, parallelquery, provisioned, or serverless"
  type        = string
  default     = "provisioned"
}

variable "engine_version" {
  description = "The version of the database engine to use"
  type        = string
  default     = "9.6.3"
}

variable "enhanced_monitoring_interval" {
  description = "The interval (in seconds) to send enhanced monitoring metrics to Cloudwatch. Set to 0 to disable enhanced monitoring"
  type        = number
  default     = 5
}

variable "existing_subnet_group" {
  description = "The name of an existing subnet group to use. If not provided, one will be created"
  type        = string
  default     = ""
}

variable "iam_database_authentication_enabled" {
  description = "Enable mapping of database accounts to IAM entities"
  type        = bool
  default     = true
}

variable "iam_roles" {
  description = "IAM roles (arns) to associate with the cluster"
  type        = list(string)
  default     = []
}

variable "instance_class" {
  description = "Instance class used to create cluster instances"
  type        = string
  default     = "db.m6g"
}

variable "instance_count" {
  description = "The number of instances to create within the cluster"
  type        = number
  default     = 1
}

variable "performance_insights_enabled" {
  description = "Whether to enable performance insights"
  type        = bool
  default     = true
}

variable "subnets" {
  description = "Required if no existing subnet group is given. A list of IDs of subnets in which to deploy the cluster"
  type        = list(string)
  default     = []
}

variable "vpc_id" {
  description = "The ID of the VPC in which to create the database"
  type        = string
}
