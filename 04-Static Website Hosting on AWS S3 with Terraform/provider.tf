terraform {
  required_version = "~> 1.7 , < 2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source = "hashicorp/random"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "mybucketbackend-demo"  ### use the s3 bucket which you created for saving the backend
    key    = "s3/state.tfstate"
    region = "ap-south-1"

  }
}

provider "aws" {
  region = "ap-south-1"

}
