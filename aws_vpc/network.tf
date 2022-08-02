#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group

resource "aws_vpc" "vpc-01" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "vpc-01-terraform"
  }
}

resource "aws_subnet" "subnet-01" {
  vpc_id     = aws_vpc.vpc-01.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet-01-terraform"
  }
}

resource "aws_internet_gateway" "igw-01" {
  vpc_id = aws_vpc.vpc-01.id

  tags = {
    Name = "igw-01-terraform"
  }
}
resource "aws_route_table" "route-table-01" {
  vpc_id = aws_vpc.vpc-01.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-01.id
  }

  tags = {
    Name = "route-table-01-terraform"
  }
}

resource "aws_route_table_association" "rta-01-terraform" {
  subnet_id      = aws_subnet.subnet-01.id
  route_table_id = aws_route_table.route-table-01.id
}
resource "aws_security_group" "security-group-01-terraform" {
  name        = "security-group-01-terraform"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.vpc-01.id

  ingress {
    description      = "ssh from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

}
