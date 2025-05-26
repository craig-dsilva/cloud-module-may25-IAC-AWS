resource "aws_db_instance" "hotel-db" {
  allocated_storage = 10
  db_name = "hotel"
  engine = "Postgres"
  engine_version = "17"
  instance_class = "db.t4g.micro"
  username = var.db_username
  password = var.db_password
  identifier = "hotel-database"
  skip_final_snapshot = true

  tags = {
    Name = "Hotel Database"
  }
}

resource "aws_security_group" "hotel-db" {
  name = "hotel-db"
  description = "Hotel database security group"

  tags = {
    Name = "Hotel Database"
  }
}

resource "aws_vpc_security_group_ingress_rule" "psql" {
  security_group_id = aws_security_group.hotel-db.id
  cidr_ipv4 = var.ec2_ip
  from_port = 5432
  to_port = 5432
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "hotel-db-ec2-outbound" {
  security_group_id = aws_security_group.hotel-db.id
  cidr_ipv4 = var.ec2_ip
  from_port = 5432
  to_port = 5432
  ip_protocol = "tcp"
}