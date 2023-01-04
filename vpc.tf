# Create VPC
resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc-cidr}"
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags      = {
    Name    = "Test VPC"
  }
}

# Create Internet Gateway 
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id    = aws_vpc.vpc.id

  tags      = {
    Name    = "Test IGW"
  }
}

# Create Public Subnet 1
resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.public-subnet-1-cidr}"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true

  tags      = {
    Name    = "Public subnet 1"
  }
}

# Create Route Table and Add Public Route
resource "aws_route_table" "public-route-table" {
  vpc_id       = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  tags       = {
    Name     = "Public Route Table"
  }
}
# Associate Public Subnet 1 to "Public Route Table"
resource "aws_route_table_association" "public-subnet-1-route-table-association" {
  subnet_id           = aws_subnet.public-subnet-1.id
  route_table_id      = aws_route_table.public-route-table.id
}
# Create Private Subnet 1
resource "aws_subnet" "private-subnet-1" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = "${var.private-subnet-1-cidr}"
  availability_zone        = "eu-west-2a"
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "Private subnet 1"
  }
}

# Create Route Table and Add Private Route
resource "aws_route_table" "privete-route-table" {
  vpc_id       = aws_vpc.vpc.id

  # route {
  #   cidr_block = "10.51.142.0/23"
  # }

  tags       = {
    Name     = "Private Route Table"
  }
}

# Associate Private Subnet 1 to "Private Route Table"
resource "aws_route_table_association" "private-subnet-1-route-table-association" {
  subnet_id           = aws_subnet.private-subnet-1.id
  route_table_id      = aws_route_table.privete-route-table.id
}