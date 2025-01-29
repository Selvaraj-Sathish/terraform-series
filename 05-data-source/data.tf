# Fetch the most recent Ubuntu 20.04 AMI ID
data "aws_ami" "latest_ubuntu_ami" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-*-20.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"]  # Canonical (Official Ubuntu) AWS Account
}

output "ubuntu_ami_id" {
  value = data.aws_ami.latest_ubuntu_ami.id
}

# Launch an EC2 instance using the fetched Ubuntu AMI
resource "aws_instance" "ubuntu_ec2_instance" {
    ami             = data.aws_ami.latest_ubuntu_ami.id
    instance_type   = "t2.micro"

    root_block_device {
        delete_on_termination = true
    }
}

# Retrieve AWS account details
data "aws_caller_identity" "account_details" {}

output "aws_account_information" {
  value = data.aws_caller_identity.account_details
}

# Retrieve VPC information tagged with "env = prod"
data "aws_vpc" "production_vpc" {
    tags = {
      env = "prod"
    }
}

output "production_vpc_arn" {
    value = data.aws_vpc.production_vpc.arn
}

# Retrieve all available AWS availability zones
data "aws_availability_zones" "available_zones" {}

output "availability_zone_names" {
    value = data.aws_availability_zones.available_zones.names
}

# Create an S3 bucket named "policy-bucket-15743-tfb"
resource "aws_s3_bucket" "policy_s3_bucket" {
    bucket = "policy-bucket-15743-tfb"
}

# Define an S3 bucket policy allowing read access (s3:GetObject)
data "aws_iam_policy_document" "s3_read_policy" {
    statement {
        sid    = "AllowPublicReadAccess"
        actions = ["s3:GetObject"]
        resources = ["${aws_s3_bucket.policy_s3_bucket.arn}/*"]
    }
}

output "s3_bucket_policy_json" {
    value = data.aws_iam_policy_document.s3_read_policy.json
}
