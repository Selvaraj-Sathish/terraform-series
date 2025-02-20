locals {
  project = "test"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    project = local.project
    name    = local.project
  }

}

resource "aws_subnet" "subnet-main" {
  count      = var.subnet-count
  cidr_block = "10.0.${count.index}.0/24"
  vpc_id     = aws_vpc.main.id

  tags = {
    project = local.project
    name    = "${local.project}-${count.index}"
  }

}
