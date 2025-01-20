resource "aws_vpc" "project-demo" {
  cidr_block = "10.172.0.0/16"

  tags = {
    Name      = "project-vpc-ec2"
    Managedby = "terraform"
  }

}



resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.project-demo.id
  cidr_block = "10.172.0.0/24"

  tags = {
    Name      = "project-vpc-ec2"
    Managedby = "terraform"
  }
}

resource "aws_internet_gateway" "public" {
  vpc_id = aws_vpc.project-demo.id

  tags = {
    Name      = "project-vpc-ec2"
    Managedby = "terraform"
  }

}

resource "aws_route_table" "public-route" {
  vpc_id = aws_vpc.project-demo.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public.id
  }

  tags = {
    Name      = "project-vpc-ec2"
    Managedby = "terraform"
  }

}

resource "aws_route_table_association" "rga" {
  route_table_id = aws_route_table.public-route.id
  subnet_id      = aws_subnet.public.id

}
