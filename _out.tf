output "admin_password" {
  description = "The initial password for the 'administrator' user within the cluster"
  value       = random_password.admin_password.result
  sensitive   = true
}

output "admitted_security_groups" {
  description = "The value provided for var.admitted_security_groups"
  value       = var.admitted_security_groups
}

output "allow_major_version_upgrade" {
  description = "The value provided for var.allow_major_version_upgrade"
  value       = var.allow_major_version_upgrade
}

output "apply_immediately" {
  description = "The value provided for var.apply_immediately"
  value       = var.apply_immediately
}

output "auto_minor_version_upgrade" {
  description = "The value provided for var.auto_minor_version_upgrade"
  value       = var.auto_minor_version_upgrade
}

output "backup_retention_period" {
  description = "The value provided for var.backup_retention_period"
  value       = var.backup_retention_period
}

output "cluster" {
  description = "The database cluster resource"
  value       = aws_rds_cluster.cluster
}

output "cluster_identifier" {
  description = "The value provided for var.cluster_identifier"
  value       = var.cluster_identifier
}

output "cluster_instances" {
  description = "The database cluster instances"
  value       = aws_rds_cluster_instance.instance
}

output "cluster_security_group" {
  description = "The security group used by the cluster"
  value       = aws_security_group.cluster_security_group
}

output "cluster_security_group_ingress" {
  description = "Ingress rules associated with the cluster's security group"
  value       = aws_security_group_rule.ingress
}

output "database_name" {
  description = "The value provided for var.database_name"
  value       = var.database_name
}

output "db_subnet_group" {
  description = "The db subnet group created by the module, or the existing subnet group name, if provided"
  value       = var.existing_subnet_group == "" ? aws_db_subnet_group.subnet_group.0.name : var.existing_subnet_group
}

output "deletion_protection" {
  description = "The value provided for var.deletion_protection"
  value       = var.deletion_protection
}

output "enabled_cloudwatch_logs_exports" {
  description = "The value provided for var.enable_cloudwatch_logs_exports"
  value       = var.enabled_cloudwatch_logs_exports
}

output "enable_http_endpoint" {
  description = "The value provided for var.enable_http_endpoint"
  value       = var.enable_http_endpoint
}

output "encryption_key" {
  description = "The KMS key used to encrypt the contents of the cluster"
  value       = aws_kms_key.encryption_key
}

output "encryption_key_alias" {
  description = "The alias of the KMS key used to encrypt the contents of the cluster"
  value       = aws_kms_alias.encryption_key_alias
}

output "engine" {
  description = "The value provided for var.engine"
  value       = var.engine
}

output "engine_mode" {
  description = "The value provided for var.engine_mode"
  value       = var.engine_mode
}

output "engine_version" {
  description = "The value provided for var.engine_version"
  value       = var.engine_version
}

output "enhanced_monitoring_interval" {
  description = "The value provided for var.enhanced_monitoring_interval"
  value       = var.enhanced_monitoring_interval
}

output "enhanced_monitoring_role" {
  description = "The role created to export enhanced monitoring metrics to Cloudwatch, if enabled"
  value       = var.enhanced_monitoring_interval == 0 ? null : aws_iam_role.enhanced_monitoring_role.0
}

output "enhanced_monitoring_role_policy_attachment" {
  description = "The attachment of the enhanced monitoring policy to the enhanced monitoring role"
  value       = var.enhanced_monitoring_interval == 0 ? null : aws_iam_role_policy_attachment.enhanced_monitoring_policy.0
}

output "existing_subnet_group" {
  description = "The value provided for var.existing_subnet_group"
  value       = var.existing_subnet_group
}

output "iam_database_authentication_enabled" {
  description = "The value provided for var.iam_database_authentication_enabled"
  value       = var.iam_database_authentication_enabled
}

output "iam_roles" {
  description = "The value provided for var.iam_roles"
  value       = var.iam_roles
}

output "instance_class" {
  description = "The value provided for var.instance_class"
  value       = var.instance_class
}

output "instance_count" {
  description = "The value provided for var.instance_count"
  value       = var.instance_count
}

output "performance_insights_enabled" {
  description = "The value provided for var.performance_insights_enabled"
  value       = var.performance_insights_enabled
}

output "subnets" {
  description = "The value provided for var.subnets"
  value       = var.subnets
}

output "vpc_id" {
  description = "The value provided for var.vpc_id"
  value       = var.vpc_id
}
