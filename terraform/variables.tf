variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "key_name" {
  description = "Existing EC2 key pair name"
  type        = string
}

variable "admin_cidr" {
  description = "Your public IP with /32"
  type        = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}
