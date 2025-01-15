### Comprehensive Terraform Commands Guide

---

#### **1. Initialization and Formatting**
- **`terraform init`**  
  Initializes a Terraform working directory by downloading the required provider plugins.

- **`terraform fmt`**  
  Formats the configuration files to Terraform’s canonical format.

- **`terraform fmt -recursive`**  
  Formats all configuration files in the current directory and subdirectories.

---

#### **2. Validation and Planning**
- **`terraform validate`**  
  Validates the configuration files for syntax and logical errors.  
  *Note: It does not guarantee successful execution.*

- **`terraform plan`**  
  Creates a preview of the changes Terraform will apply to the infrastructure.

- **`terraform plan -out=<plan_name>`**  
  Saves the plan to a file (e.g., `project1plan`). This file can later be inspected or applied.

---

#### **3. Applying and Managing Infrastructure**
- **`terraform apply`**  
  Applies the Terraform configurations to create/update infrastructure. Prompts for confirmation by default.

- **`terraform apply <plan_name>`**  
  Applies the saved plan file directly without asking for confirmation.

- **`terraform destroy`**  
  Destroys all resources defined in the configuration files.

---

#### **4. Workspace Management**
- **`terraform workspace list`**  
  Lists all available workspaces.

- **`terraform workspace new <workspace_name>`**  
  Creates a new workspace (e.g., `dev`, `staging`, `prod`).

- **`terraform workspace select <workspace_name>`**  
  Switches to a specific workspace.

---

#### **5. State File Operations**
- **`terraform state list`**  
  Lists all resources in the current state file.

- **`terraform state show <resource_name>`**  
  Shows details of a specific resource in the state file.

- **`terraform state mv <source> <destination>`**  
  Moves a resource in the state file to a new name or module.

- **`terraform state rm <resource_name>`**  
  Removes a resource from the Terraform state file.

---

#### **6. Outputs and Resource Inspection**
- **`terraform output`**  
  Displays output variables from the state file.

- **`terraform output -json`**  
  Displays output variables in JSON format.

- **`terraform show`**  
  Displays detailed information about the current state or a saved plan.

- **`terraform show <plan_name>`**  
  Displays detailed information about a specific saved plan file.

---

#### **7. Advanced Commands**
- **`terraform refresh`**  
  Updates the state file with real-time information from the infrastructure.

- **`terraform taint <resource_name>`**  
  Marks a resource for recreation during the next `terraform apply`.

- **`terraform untaint <resource_name>`**  
  Removes a taint, preventing the resource from being recreated.

- **`terraform import <address> <id>`**  
  Imports an existing resource into the Terraform state file.

---

#### **8. Best Practices**
- Use `terraform workspace` for managing isolated environments like `dev`, `staging`, or `prod`.
- Always run `terraform validate` and `terraform plan` before applying changes.
- Save plans with `terraform plan -out=<plan_name>` for review and later execution.
- Keep the state file secure as it contains sensitive information (e.g., secret keys, resource IDs).

---

### Advanced Usage Examples:
1. **Create and Use a Workspace:**
   ```bash
   terraform workspace new dev
   terraform workspace select dev
---

### Key Notes:
- Regularly check the state file with terraform show or terraform state list.
- Use taint/untaint commands cautiously for targeted resource updates.
- Keep workspaces consistent to avoid managing multiple state files unnecessarily.

