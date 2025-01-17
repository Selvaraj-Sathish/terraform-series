# Terraform Provider Alias to Manage Resources in Multiple Regions

This guide demonstrates how to use Terraform provider aliases to create resources, such as AWS S3 buckets, in multiple regions.

## Overview

When working with Terraform, you may need to deploy resources in different AWS regions. By default, Terraform uses the region specified in the `provider` block. However, when you need to deploy resources to multiple regions simultaneously, using provider aliases allows you to manage different configurations for each region.

## Prerequisites

- Terraform installed (version 0.13 or later).
- AWS credentials set up (via `aws configure` or environment variables).
- Basic knowledge of Terraform.

## Terraform Configuration

### Provider Configuration

Define multiple configurations for the same provider to manage resources in different regions. The first provider block will be used by default, and the second provider will be specified using an alias.

```hcl
provider "aws" {
  region = "ap-south-1"  # Default provider targeting Asia Pacific (Mumbai) region
}

provider "aws" {
  region = "us-east-1"  # Aliased provider targeting US East (N. Virginia) region
  alias  = "us-east"
}

## Resource Definition
Terraform will default to the first provider block unless an aliased provider is referenced. In this example, the second S3 bucket is created in the `us-east-1` region.

```hcl
resource "aws_s3_bucket" "ap_south_bucket" {
  bucket = "some-random-name-ap-south"
  acl    = "private"  # Example ACL (optional)
}

resource "aws_s3_bucket" "us_east_bucket" {
  provider = aws.us-east  # Explicitly reference the aliased provider
  bucket   = "some-random-name-us-east"
  acl      = "private"    # Example ACL (optional)
}




