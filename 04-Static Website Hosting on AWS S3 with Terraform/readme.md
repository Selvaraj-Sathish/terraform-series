# Static Website Hosting on AWS S3 with Terraform

This project demonstrates hosting a static website on AWS S3 using Terraform. The goal is to automate the creation of S3 resources and the deployment of a static website without using the AWS Management Console.

---

## Features

- **S3 Bucket Creation**: Creates an S3 bucket specifically for static website hosting.
- **Bucket Policy Configuration**: Allows public access to the bucket while adhering to security practices.
- **Static Website Hosting**: Configures the bucket for website hosting with index and error documents.
- **HTML File Upload**: Automates the deployment of website files to S3.
- **Public Access URL**: Generates a public URL for the static website.

---

## Prerequisites

- **AWS Account**: Ensure you have access to an AWS account with required permissions.
- **Terraform Installed**: [Terraform CLI](https://www.terraform.io/downloads) should be installed locally.
- **HTML Website Files**: A ready-to-use `index.html` file for the website.
- **AWS CLI Configured**: Your credentials should be set up for Terraform to interact with AWS.

---

