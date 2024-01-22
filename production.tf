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
  subnet_ids           = ["subnet-04613a554eba04b04", "subnet-06bdc8634d71a49ed"]
  vpc_id               = "vpc-02c1deac11ba9ea9b"
  docdb_instance_class = "db.r4.large"
  docdb_password       = "fast-food"
  vpc_security_group_ids = [
    "sg-0bd1f3f5df705bd04"
  ]
}