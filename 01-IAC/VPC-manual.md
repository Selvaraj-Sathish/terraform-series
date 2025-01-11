Creating VPCs and Subnets Manually in AWS
Introduction
In this exercise, you will manually build a simple VPC and subnet infrastructure using the AWS Management Console. This includes:

Creating a VPC
Configuring two subnets (public and private)
Setting up an Internet Gateway
Configuring a route table and associating it with the public subnet
By performing this exercise, you'll gain hands-on experience and develop a deeper understanding of the intricacies of infrastructure creation. This manual approach provides insight into the challenges of managing resources without automation, highlighting the value of using Infrastructure as Code (IaC).

Desired Outcome
By the end of this exercise, the solution should include:

VPC:

CIDR block: 192.168.0.0/16
Subnets:

Public subnet: CIDR block: 192.168.1.0/24
Private subnet: CIDR block: 192.168.2.0/24
Internet Gateway:

Attached to the VPC
Public Route Table:

Includes a route to the Internet Gateway (0.0.0.0/0)
Associated with the public subnet
Step-by-Step Guide
1. Log in to the AWS Console
Visit the AWS Management Console and log in to your account.
Navigate to the VPC Dashboard.
2. Create the VPC
In the VPC Dashboard, click Your VPCs and select Create VPC.
Enter a Name tag (e.g., MyCustomVPC).
Set the IPv4 CIDR block to 192.168.0.0/16.
Click Create to finalize the VPC.
3. Create Subnets
Public Subnet
Go to Subnets and click Create Subnet.
Enter a Name tag (e.g., PublicSubnet).
Select the VPC you just created.
Specify the CIDR block as 192.168.1.0/24.
Click Create subnet.
Private Subnet
Repeat the above steps to create a Private Subnet:
Name tag: PrivateSubnet
CIDR block: 192.168.2.0/24
4. Create and Attach an Internet Gateway
Go back to the VPC Dashboard and click on Internet Gateways.
Click Create Internet Gateway and provide a Name tag (e.g., MyInternetGateway).
Click Create to finish.
Select the Internet Gateway you just created, click Actions, and select Attach to VPC.
Choose the VPC you created earlier and click Attach Internet Gateway.
5. Create a Public Route Table
Go to the Route Tables section and click Create Route Table.
Provide a Name tag (e.g., PublicRouteTable) and select your VPC.
Click Create Route Table.
Add a Route to the Internet Gateway
Select the Route Table you just created, go to the Routes tab, and click Edit Routes.
Click Add Route and do the following:
Destination: 0.0.0.0/0
Target: Select the Internet Gateway you created.
Click Save Changes.
Associate the Route Table with the Public Subnet
Navigate to the Subnet Associations tab of the route table.
Click Edit Subnet Associations.
Select the Public Subnet and click Save Associations.
Congratulations on Completing the Exercise! í¾‰
Youâ€™ve successfully:

Created a VPC.
Configured a Public Subnet and Private Subnet.
Added an Internet Gateway.
Set up a Route Table to enable internet access for the public subnet.
This hands-on experience showcases the complexity of manual resource management and lays the groundwork for understanding the efficiency of automating these tasks with Infrastructure as Code (IaC) tools like Terraform.


Want to Automate This? Learn Terraform!
To take this infrastructure management process to the next level, you can automate it using Terraform, a powerful IaC tool. Terraform allows you to write reusable, consistent, and version-controlled configurations for deploying resources across multiple environments.

Visit the detailed guide on how to set up this same infrastructure using Terraform on my GitHub repository: Terraform VPC Guide. Stay tuned for an upcoming video where I walk you through step-by-step!

Switch from manual setup to automation today! íº€
