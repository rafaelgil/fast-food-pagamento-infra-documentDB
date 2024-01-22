
resource "aws_docdb_subnet_group" "docdb_subnet_group" {
  name       = "fast-food-docdb-docdb-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "fast-food-docdb-docdb-subnet-group"
    Environment = "Test"
  }
}

resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "fast-food-docdb-cluster"
  master_username         = var.docdb_user
  master_password         = var.docdb_password
  db_subnet_group_name    = aws_docdb_subnet_group.docdb_subnet_group.name
  apply_immediately = true
  skip_final_snapshot     = true

  engine      = "docdb"
  engine_version = "3.6.0"

  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = "fast-food-docdb-cluster"
    Environment = "Test"
  }
}