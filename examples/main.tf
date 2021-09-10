module "my_rds_db" {
  source = "../"

  cluster_identifier_prefix = "my-rds-cluster"

  admitted_security_groups = ["sg-123123"]
  subnets                  = ["subnet-123123", "subnet-234234", "subnet-345345"]
  vpc_id                   = "vpc-123123"
}
