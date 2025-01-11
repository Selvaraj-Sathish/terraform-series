# AWS VPC Series: Manual Setup vs. IaC with Terraform  

## Introduction  

This project provides a hands-on demonstration of creating AWS resources manually via the Management Console and automating the same tasks using **Infrastructure as Code (IaC)** with Terraform.  

The aim is to help you understand:  
- What IaC is and how it simplifies resource provisioning.  
- The advantages of using Terraform over manual methods.  
- How to transition from basic concepts to expert-level implementations of AWS infrastructure automation.  

## Objectives  

By following this project, you will:  
1. Learn how to manually create AWS resources.  
2. Understand the concepts of Terraform and IaC automation.  
3. Implement step-by-step tasks starting from basic to advanced levels.  

### Resources You Will Create  

- **AWS VPC** with public and private subnets.  
- **Internet Gateway** to enable external access.  
- **Route Tables** for subnet routing.  
- More advanced AWS resources (to be covered in subsequent demos).  

---

## Why IaC with Terraform?  

Creating resources manually through the AWS Console is a good starting point to understand the underlying concepts. However, as infrastructures grow, manual processes can become time-consuming and prone to human error.  

IaC using tools like Terraform allows you to:  
- **Automate provisioning** of infrastructure through code.  
- Ensure **consistency** by avoiding configuration drift.  
- Enable **version control** for infrastructure changes.  
- Simplify **rollbacks** and disaster recovery.  

This project demonstrates the benefits of IaC by comparing manual methods to Terraform automation.  

---

## Contents  

### Step-by-Step Learning Path  
We will build our expertise progressively:  
1. **Manual VPC Setup**  
   - Manually create a VPC, subnets, Internet Gateway, and Route Tables using the AWS Management Console.  
2. **IaC with Terraform**  
   - Replicate the above setup using Terraform.  
   - Understand how Terraform manages resources efficiently through `.tf` configuration files.  


