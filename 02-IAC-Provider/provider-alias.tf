terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "mybucketbackend-demo"
    key    = "provider/state.tfstate"
    region = "ap-south-1"

  }
}



provider "aws" {
  region = "ap-south-1"
}

provider "aws" {
  region = "us-east-1"
  alias  = "us-east"

}

resource "random_id" "s3_bucket" {
  byte_length = 7

}

resource "aws_s3_bucket" "default-reg" {
  bucket = "defaultreg-${random_id.s3_bucket.hex}"

}

resource "aws_s3_bucket" "other-reg" {
  bucket   = "otherreg-${random_id.s3_bucket.hex}"
  provider = aws.us-east

}

output "s3_bucket_other" {
  value = aws_s3_bucket.other-reg
}

output "s3_bucket_default" {
  value = aws_s3_bucket.default-reg
  
}
