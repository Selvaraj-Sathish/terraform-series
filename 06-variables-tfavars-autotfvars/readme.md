# Terraform Variable Precedence

Terraform allows defining variables in multiple ways. The precedence order determines which value is used when multiple sources define the same variable.

## **Variable Precedence Order (Highest to Lowest)**
1. **CLI Variables (`-var` and `-var-file`)**  
   - Example:  
     ```sh
     terraform apply -var="instance_type=t2.micro"
     terraform apply -var-file=custom.tfvars
     ```
   - Overrides all other variable sources.

2. **Auto-loaded `.auto.tfvars` Files**  
   - Files ending in `.auto.tfvars` (e.g., `prod.auto.tfvars`) are **automatically loaded** by Terraform.  
   - These take precedence over manually referenced `.tfvars` files.  

3. **Explicit `.tfvars` Files (`terraform.tfvars`, `prod.tfvars`)**  
   - If `terraform.tfvars` exists in the working directory, Terraform loads it automatically.  
   - Additional `.tfvars` files (e.g., `prod.tfvars`) must be manually specified:  
     ```sh
     terraform apply -var-file=prod.tfvars
     ```

4. **Environment Variables (`TF_VAR_*`)**  
   - Terraform reads environment variables prefixed with `TF_VAR_`.  
   - Example:  
     ```sh
     export TF_VAR_instance_type=t2.large
     terraform apply
     ```
   - These values override default values in `var.tf` but are lower in precedence than `.tfvars` files and CLI variables.

5. **Default Values in `var.tf`**  
   - If no other sources define a variable, Terraform uses the default value from `var.tf`:  
     ```hcl
     variable "instance_type" {
       default = "t2.nano"
     }
     ```
   - This is the lowest precedence.

---

## **Summary Table**
| Source                         | Example Usage                                   | Precedence  |
|--------------------------------|-----------------------------------------------|------------|
| **CLI (`-var`)**               | `terraform apply -var="instance_type=t2.micro"` | 🔥 Highest |
| **Auto-loaded `.auto.tfvars`**  | `prod.auto.tfvars` (automatically loaded)     | 🔼         |
| **Explicit `.tfvars` files**    | `terraform apply -var-file=prod.tfvars`       | 🔽         |
| **Environment Variables**       | `export TF_VAR_instance_type=t2.large`        | 🔽         |
| **Defaults in `var.tf`**        | `variable "instance_type" { default = "t2.nano" }` | ❄️ Lowest  |

---

## **Conclusion**
Understanding variable precedence ensures that the correct values are used in your Terraform configurations. Use `.auto.tfvars` for automatic environment-based settings, `-var-file` for explicit environment configuration, and CLI variables for quick overrides.

Happy Terraforming! 🚀
