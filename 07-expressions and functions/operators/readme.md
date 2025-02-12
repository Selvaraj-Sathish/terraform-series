# Terraform Operators

## Overview
Terraform provides various operators to perform arithmetic, comparison, and logical operations. These operators help define conditions, calculations, and logic within Terraform configurations.

## 1. Arithmetic Operators
Arithmetic operators allow mathematical calculations within Terraform.

| Operator | Description | Example | Result |
|----------|------------|---------|--------|
| `+` | Addition | `3 + 2` | `5` |
| `-` | Subtraction | `7 - 4` | `3` |
| `*` | Multiplication | `7 * 5` | `35` |
| `/` | Division | `10 / 2` | `5` |
| `%` | Modulus | `10 % 3` | `1` |

### Example Usage
```hcl
locals {
  math = 7 * 5  # Result: 35
}
```

## 2. Comparison Operators
Comparison operators return boolean values (`true` or `false`) based on comparisons.

| Operator | Description | Example | Result |
|----------|------------|---------|--------|
| `==` | Equal to | `5 == 5` | `true` |
| `!=` | Not equal to | `5 != 3` | `true` |
| `>` | Greater than | `4 > 2` | `true` |
| `<` | Less than | `3 < 2` | `false` |
| `>=` | Greater than or equal to | `5 >= 5` | `true` |
| `<=` | Less than or equal to | `3 <= 2` | `false` |

### Example Usage
```hcl
locals {
  equal      = 5 != 3  # Result: true
  comparison = 3 <= 2  # Result: false
}
```

## 3. Logical Operators
Logical operators help evaluate boolean conditions.

| Operator | Description | Example | Result |
|----------|------------|---------|--------|
| `&&` | Logical AND | `true && false` | `false` |
| `||` | Logical OR | `true || false` | `true` |
| `!` | Logical NOT | `!false` | `true` |

### Example Usage
```hcl
locals {
  logical = !false  # Result: true
}
```

## 4. Using Operators in Outputs
You can use operators in `output` blocks to display computed values.

```hcl
output "operators" {
  value = {
    math       = local.math
    equal      = local.equal
    comparison = local.comparison
    logical    = local.logical
  }
}
```

### Expected Output
```
operators = {
  math       = 35
  equal      = true
  comparison = false
  logical    = true
}
```

## Conclusion
Terraform operators allow for calculations, comparisons, and logic handling within configurations. By mastering these operators, you can create more dynamic and efficient Terraform scripts.

### Want to Learn More?
Refer to the [Terraform Documentation](https://developer.hashicorp.com/terraform/docs) for more details.

