resource "aws_db_instance" "this" {
  identifier = "${var.name}-rds"

  engine         = "mysql"
  engine_version = "8.0"

  instance_class = "db.t3.micro"

  allocated_storage = 20
  storage_encrypted = true

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  multi_az = true

  vpc_security_group_ids = [var.rds_sg_id]
  db_subnet_group_name   = aws_db_subnet_group.this.name
  parameter_group_name   = aws_db_parameter_group.this.name

  publicly_accessible = false

  skip_final_snapshot = true

  tags = {
    Name = "${var.name}-rds"
  }
}