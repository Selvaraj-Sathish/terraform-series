# Terraform Configuration Guide

## Overview

This repository outlines a Terraform-based project to create and manage an AWS infrastructure. The project includes creating:

- **VPC**
- **Public Subnet**
- **Internet Gateway**
- **Route Table** and **Route Table Association**
- **Security Group**
- **EC2 Instance** running Bitnami NGINX, accessible via a public IP.

---

## Key Points

### Project Components

- **VPC**: A Virtual Private Cloud to host your resources.
- **Public Subnet**: A subnet within the VPC to allow public-facing resources.
- **Internet Gateway**: To enable internet access for resources in the public subnet.
- **Route Table and Association**: A route table to define how traffic flows between the subnet and the internet gateway, and its association with the public subnet.
- **Security Group**: A security group to allow HTTP/HTTPS traffic to the EC2 instance.
- **EC2 Instance**: An instance running Bitnami NGINX, accessible using a public IP address.

---

## How to Run

### 1. Clone or Download this Repository

- If you don't have a repository set up yet:
  - Create one with the project configuration files.
  - Or simply download the relevant files.

### 2. Initialize Your Terraform Working Directory

- Open your terminal in the project directory and run the following command to initialize Terraform:

```bash
terraform init
```

### 3. Apply Your Terraform Plan

- Once initialized, apply the Terraform plan to preview the resources:

```bash
terraform plan
```

### 4. Apply Your Terraform Plan

- Once the plan correct, apply the configuration to deploy your resources:

```bash
terraform apply
```

### 5. Review Changes and Confirm

- Terraform will prompt you to confirm the changes before applying them.
- Type `yes` to proceed.

---

## Additional Notes

- Ensure your AWS credentials are correctly configured before running the Terraform commands.
- Modify configuration variables like VPC CIDR block, subnet range, and instance details as needed to suit your requirements.
- Verify that your EC2 instance is accessible via its public IP after deployment.

---

## License

This project is open for personal and educational use. Feel free to clone and use it as needed.
