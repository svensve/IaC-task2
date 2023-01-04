# VPC Variables
variable "region" {
  default       = "eu-west-2"
  description   = "AWS Region"
  type          = string
}

variable "vpc-cidr" {
  default       = "10.51.142.0/23"
  description   = "VPC CIDR Block"
  type          = string
}

variable "public-subnet-1-cidr" {
  default       = "10.51.142.0/25"
  description   = "Public Subnet 1 CIDR Block"
  type          = string
}

variable "private-subnet-1-cidr" {
  default       = "10.51.142.128/25"
  description   = "Private Subnet 1 CIDR Block"
  type          = string
}