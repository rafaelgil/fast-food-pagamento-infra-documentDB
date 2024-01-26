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
  subnet_ids           = ["subnet-07cfdc74862fb5a39", "subnet-0d7c3c1a48777ce60"]
  vpc_id               = "vpc-0fe5292222d495854"
  docdb_instance_class = "db.r5.large"
  vpc_security_group_ids = [
    "sg-058d9aea3f43b735f"
  ]
}