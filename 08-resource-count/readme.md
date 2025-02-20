# AWS VPC and Multiple Subnets with Terraform  

## Overview  

This project demonstrates how to create an **AWS Virtual Private Cloud (VPC)** and dynamically provision multiple subnets using Terraform’s `count` meta-argument. This approach helps in reducing code duplication and making infrastructure more scalable.  

## Features  

- Creates an **AWS VPC** with a predefined CIDR block.  
- Uses **Terraform `count`** to dynamically generate multiple subnets.  
- Assigns unique **CIDR blocks** and **tags** to each subnet.  
- Makes subnet count configurable using the `subnet_count` variable.  

## Prerequisites  

- Terraform installed on your local machine.  
- AWS CLI configured with the necessary credentials.  



