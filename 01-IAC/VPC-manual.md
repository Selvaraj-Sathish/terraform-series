# Creating VPCs and Subnets Manually in AWS

## Introduction

In this exercise, you will manually set up a basic VPC and subnet infrastructure using the AWS Management Console. This includes:

- Creating a VPC
- Configuring a public subnet and a private subnet
- Attaching an Internet Gateway
- Setting up a route table for public subnet connectivity

Understanding this manual process will help you appreciate the advantages of automating such tasks with tools like Terraform or AWS CloudFormation.

## Objectives

You will manually create the following resources:

1. **VPC**: CIDR block `192.168.0.0/16`
2. **Public Subnet**: CIDR block `192.168.0.0/24`
3. **Private Subnet**: CIDR block `192.168.1.0/24`
4. **Internet Gateway**: Attached to the VPC
5. **Public Route Table**:
   - Includes a route to the Internet Gateway (`0.0.0.0/0`)
   - Associates the public subnet with the route table

## Steps

### Step 1: Create a VPC

1. Log in to the **AWS Management Console**.
2. Navigate to **Services > VPC > Your VPCs**.
3. Click **Create VPC**.
4. Enter the following details:
   - **Name tag**: `MyVPC`
   - **IPv4 CIDR block**: `192.168.0.0/16`
5. Click **Create VPC**.

### Step 2: Create Subnets

#### Create the Public Subnet

1. Go to **Subnets** and click **Create Subnet**.
2. Enter the following details:
   - **Name tag**: `PublicSubnet`
   - **VPC ID**: Select your VPC (`MyVPC`)
   - **IPv4 CIDR block**: `192.168.0.0/24`
3. Click **Create Subnet**.

#### Create the Private Subnet

1. Repeat the steps above with the following details:
   - **Name tag**: `PrivateSubnet`
   - **IPv4 CIDR block**: `192.168.1.0/24`
2. Click **Create Subnet**.

### Step 3: Create and Attach an Internet Gateway

1. Go to **Internet Gateways** and click **Create Internet Gateway**.
2. Enter the following details:
   - **Name tag**: `MyInternetGateway`
3. Click **Create Internet Gateway**.
4. Attach the Internet Gateway:
   - Select your Internet Gateway (`MyInternetGateway`).
   - Click **Actions > Attach to VPC**.
   - Choose your VPC (`MyVPC`) and click **Attach Internet Gateway**.

### Step 4: Configure the Route Table

#### Create the Public Route Table

1. Navigate to **Route Tables** and click **Create Route Table**.
2. Enter the following details:
   - **Name tag**: `PublicRouteTable`
   - **VPC ID**: Select your VPC (`MyVPC`)
3. Click **Create Route Table**.

#### Add a Route for Internet Access

1. Select your newly created route table (`PublicRouteTable`).
2. Go to the **Routes** tab and click **Edit routes**.
3. Add the following details:
   - **Destination**: `0.0.0.0/0`
   - **Target**: Select your Internet Gateway (`MyInternetGateway`)
4. Click **Save Changes**.

#### Associate the Public Subnet

1. In the **Subnet Associations** tab of the route table, click **Edit subnet associations**.
2. Select the **PublicSubnet** you created earlier.
3. Click **Save Associations**.

---

## Conclusion

Congratulations! You've manually set up a VPC with public and private subnets, an Internet Gateway, and a public route table. This manual process provides valuable insights into AWS networking.

**Next steps**: Explore automating such tasks with tools like Terraform for improved efficiency and consistency.  **Go to VPC-terraform.md**
