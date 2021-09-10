resource "aws_iam_role" "enhanced_monitoring_role" {
  count = var.enhanced_monitoring_interval == 0 ? 0 : 1

  name               = "${var.cluster_identifier}-enhanced-monitoring"
  assume_role_policy = file("${path.module}/templates/assume-role-policy.json")
}

resource "aws_iam_role_policy_attachment" "enhanced_monitoring_policy" {
  count = var.enhanced_monitoring_interval == 0 ? 0 : 1

  role       = aws_iam_role.enhanced_monitoring_role.0.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}
