variable "public_key" {
  type      = string
  sensitive = true
}

variable "home_ip" {
  type      = string
  sensitive = true
}

variable "db_username" {
  type = string
  sensitive = true
}

variable "db_password" {
  type = string
  sensitive = true
}

variable "ec2_ip" {
  type = string
  sensitive = true
}