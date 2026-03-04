//ALB Security Group
resource "aws_security_group" "alb_sg" {
  name        = "${var.name}-alb-sg"
  description = "Allow HTTP/HTTPS from internet"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-alb-sg"
  }
}

//EC2 Security Group
resource "aws_security_group" "ec2_sg" {
  name        = "${var.name}-ec2-sg"
  description = "Allow traffic only from ALB"
  vpc_id      = var.vpc_id

  ingress {
    description     = "App traffic from ALB"
    from_port       = var.app_port
    to_port         = var.app_port
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-ec2-sg"
  }
}

# RDS Security Group
resource "aws_security_group" "rds_sg" {
  name        = "${var.name}-rds-sg"
  description = "Allow DB traffic only from EC2"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Database access from EC2"
    from_port       = var.db_port
    to_port         = var.db_port
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-rds-sg"
  }
}
# NAT Security Group //(Minimal / Defensive)

resource "aws_security_group" "nat_sg" {
  name        = "${var.name}-nat-sg"
  description = "NAT outbound traffic control"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-nat-sg"
  }
}