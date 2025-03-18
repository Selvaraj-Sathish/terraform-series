# Terraform Module Structure Guidelines

## Minimal Module Structure

A well-organized Terraform module should follow a consistent structure to ensure maintainability and ease of use. The minimal recommended structure includes:

```
module-name/
├── LICENSE
├── README.md
├── main.tf
├── variables.tf
└── outputs.tf
```

## File Purposes

### LICENSE

Contains the license information for the module. Common options include:
- MIT License
- Apache License 2.0
- Mozilla Public License 2.0

Example MIT License snippet:
```
MIT License

Copyright (c) [year] [copyright holder]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software...
```

### README.md

Documentation for the module including:
- Purpose of the module
- Usage examples
- Input variables
- Outputs
- Requirements

### main.tf

Contains the primary resources and module logic:
- Resource definitions
- Data sources
- Local variables
- Module calls

### variables.tf

Defines all input variables for the module:
- Type constraints
- Default values
- Descriptions
- Validation rules

Example:
```hcl
variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t3.micro"
}
```

### outputs.tf

Defines all outputs from the module:
- Values to be referenced by the calling module
- Descriptions

Example:
```hcl
output "instance_id" {
  description = "ID of the created EC2 instance"
  value       = aws_instance.this.id
}
```

## Best Practices

1. **Naming Convention**: Use snake_case for resource names, variables, and outputs.
2. **Documentation**: Document all variables and outputs with clear descriptions.
3. **Version Constraints**: Specify provider and Terraform version constraints.
4. **Validation**: Add validation rules for input variables where appropriate.
5. **Examples**: Include working examples in the README or a separate examples directory.

## Additional Files (Optional)

For more complex modules, consider adding:

```
module-name/
├── examples/
│   └── basic/
│       ├── main.tf
│       └── outputs.tf
├── test/
│   └── module_test.go
└── versions.tf
```

- `versions.tf`: Specifies Terraform and provider version constraints
- `examples/`: Contains working examples of the module
- `test/`: Contains automated tests

## Example Usage

```hcl
module "web_server" {
  source  = "./modules/web-server"
  
  instance_type  = "t3.small"
  instance_count = 2
  vpc_id         = "vpc-0123456789abcdef0"
}

output "instance_ids" {
  value = module.web_server.instance_ids
}
```
