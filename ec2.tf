resource "aws_security_group" "cluster_security_group" {
  name        = var.cluster_identifier_prefix
  description = "Allow database connections from trusted resources only"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "ingress" {
  for_each = toset(var.admitted_security_groups)

  type              = "ingress"
  from_port         = aws_rds_cluster.cluster.port
  to_port           = aws_rds_cluster.cluster.port
  protocol          = "tcp"
  security_group_id = aws_security_group.cluster_security_group.id
}
