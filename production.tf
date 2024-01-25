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
  subnet_ids           = ["subnet-07feb062c5ccf071c", "subnet-0420b3c2c14b17c36"]
  vpc_id               = "vpc-07a59b130204263c2"
  docdb_instance_class = "db.r5.large"
  vpc_security_group_ids = [
    "sg-029841ea9f1cbd5cc"
  ]
}