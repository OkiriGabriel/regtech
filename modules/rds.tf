resource "aws_db_instance" "main" {
  identifier           = "regtech-db"
  engine               = "postgres"
  engine_version       = "16"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  storage_type         = "gp2"
  storage_encrypted    = true
  kms_key_id           = aws_kms_key.rds.arn
  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password
  vpc_security_group_ids = [aws_security_group.rds.id]
  db_subnet_group_name = aws_db_subnet_group.main.name
  skip_final_snapshot  = true
}

resource "aws_kms_key" "rds" {
  description = "KMS key for RDS encryption"
}

resource "aws_security_group" "rds" {
  name        = "regtech-rds-sg"
  description = "Security group for RDS instance"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = var.private_subnets
  }
}

resource "aws_db_subnet_group" "main" {
  name       = "regtech-db-subnet-group"
  subnet_ids = aws_subnet.private[*].id

  tags = {
    Name = "DB Subnet Group"
  }
}
