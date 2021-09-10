resource "aws_kms_key" "encryption_key" {
  description = "Encrypts the contents of the RDS cluster '${var.cluster_identifier_prefix}'"
  policy = templatefile("${path.module}/templates/kms-key-policy.json.tpl", {
    account_id = data.aws_caller_identity.current.account_id
  })
  enable_key_rotation = true

  tags = {
    "Managed By Terraform" = ""
  }
}

resource "aws_kms_alias" "encryption_key_alias" {
  name          = "alias/${var.cluster_identifier_prefix}-encryption-key"
  target_key_id = aws_kms_key.encryption_key.key_id
}
