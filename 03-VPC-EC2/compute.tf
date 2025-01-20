resource "aws_instance" "web" {
  ami                         = "ami-0be8d31aa22023562"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.project-demo.id]

  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp2"
  }

  tags = {
    Name = "demoproject"
    Managedby = "Terraform"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "project-demo" {
  vpc_id = aws_vpc.project-demo.id

}

resource "aws_vpc_security_group_ingress_rule" "http" {
  description       = "allow http and https"
  security_group_id = aws_security_group.project-demo.id
  cidr_ipv4        = "0.0.0.0/0"
  to_port           = 80
  from_port         = 80
  ip_protocol       = "tcp"

}

resource "aws_vpc_security_group_ingress_rule" "https" {
  description       = "allow http and httpss"
  security_group_id = aws_security_group.project-demo.id
  cidr_ipv4        = "0.0.0.0/0"
  to_port           = 443
  from_port         = 443
  ip_protocol       = "tcp"

}
