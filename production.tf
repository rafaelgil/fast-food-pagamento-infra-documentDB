/*====
Variables used across all modules
======*/
locals {
  environment = "fast-food"
}

provider "aws" {
  region = var.region
}

module "documentDB" {
  source               = "./documentDB"
  environment          = local.environment
  subnet_ids           = ["subnet-065449805451caff0", "subnet-091e01762f5d9aff3"]
  vpc_id               = "vpc-0f82249b93e7a254c"
  docdb_instance_class = "db.r4.large"
  vpc_security_group_ids = [
    "sg-08815d5adcf3e997d"
  ]
}