resource "aws_rds_cluster" "cluster" {
  allow_major_version_upgrade         = var.allow_major_version_upgrade
  apply_immediately                   = var.apply_immediately
  backup_retention_period             = var.backup_retention_period
  cluster_identifier_prefix           = var.cluster_identifier_prefix
  copy_tags_to_snapshot               = true
  database_name                       = var.database_name
  db_subnet_group_name                = var.existing_subnet_group == "" ? var.existing_subnet_group : aws_db_subnet_group.subnet_group.0.name
  deletion_protection                 = var.deletion_protection
  enable_http_endpoint                = var.enable_http_endpoint
  enabled_cloudwatch_logs_exports     = var.enabled_cloudwatch_logs_exports
  engine                              = var.engine
  engine_mode                         = var.engine_mode
  engine_version                      = var.engine_version
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  iam_roles                           = var.iam_roles == [] ? null : var.iam_roles
  kms_key_id                          = aws_kms_key.encryption_key.arn
  master_password                     = random_password.admin_password.result
  master_username                     = "administrator"
  preferred_backup_window             = "01:00-01:30"
  skip_final_snapshot                 = true
  storage_encrypted                   = true
  vpc_security_group_ids              = [aws_security_group.cluster_security_group.id]

  tags = {
    "Managed By Terraform" = ""
  }
}

resource "aws_db_subnet_group" "subnet_group" {
  count = var.existing_subnet_group == "" ? 1 : 0

  name       = "${var.cluster_identifier_prefix}-subnet-group"
  subnet_ids = var.subnets

  tags = {
    "Managed By Terraform" = ""
  }
}
