resource "aws_instance" "hotel-server" {
  ami             = "ami-03d8b47244d950bbb" # Amazon Linux 2023
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.hotel-server.key_name
  security_groups = [aws_security_group.hotel-server.name]

  tags = {
    Name = "Hotel Server"
  }
}

resource "aws_key_pair" "hotel-server" {
  key_name   = "hotel-server"
  public_key = var.public_key
}

resource "aws_security_group" "hotel-server" {
  name        = "hotel-server"
  description = "Hotel Server default security group"

  tags = {
    Name = "Hotel Server"
  }
}

# Security Group
resource "aws_vpc_security_group_ingress_rule" "SSH" {
  security_group_id = aws_security_group.hotel-server.id
  cidr_ipv4         = var.home_ip
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "HTTP" {
  security_group_id = aws_security_group.hotel-server.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "HTTPS" {
  security_group_id = aws_security_group.hotel-server.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}

# Elastic IP
resource "aws_eip" "hotel-server" {
  instance = aws_instance.hotel-server.id

  tags = {
    Name = "Hotel Server"
  }
}