# Terraform `for` Expression with Lists

## Introduction

Terraform provides powerful expressions to manipulate and analyze data in lists. In this guide, we will explore how to use the `for` expression to transform lists of numbers and objects effectively. By the end of this exercise, you'll be able to apply list comprehensions in Terraform to create dynamic infrastructure configurations.

## What We Will Learn

We will:
1. Define a list of numbers and a list of objects.
2. Use the `for` expression to create new lists based on transformations.
3. Extract and manipulate values from a list of objects.

## Step-by-Step Guide

### Step 1: Define Variables

We start by defining two Terraform variables:
- `ages`: A list of numbers.
- `people`: A list of objects with `name` and `age` properties.

```hcl
variable "ages" {
  type = list(number)
}

variable "people" {
  type = list(object({
    name = string
    age  = number
  }))
}
```

### Step 2: Double the Numbers

Create a new list `doubled_ages` where each number in `ages` is doubled:

```hcl
locals {
  doubled_ages = [for age in var.ages : age * 2]
}
```

### Step 3: Filter Even Numbers

Create a new list `even_ages` that contains only even numbers from `ages`:

```hcl
locals {
  even_ages = [for age in var.ages : age if age % 2 == 0]
}
```

### Step 4: Extract Names from Objects

Create a list `names` that extracts only the names from the `people` list:

```hcl
locals {
  names = [for person in var.people : person.name]
}
```

### Step 5: Create a List of Descriptions

Create a new list `descriptions` that combines name and age into a descriptive string:

```hcl
locals {
  descriptions = [for person in var.people : "${person.name} is ${person.age} years old"]
}
```

### Step 6: Output the Values

Display the transformed lists using Terraform outputs:

```hcl
output "doubled_ages" {
  value = local.doubled_ages
}

output "even_ages" {
  value = local.even_ages
}

output "names" {
  value = local.names
}

output "descriptions" {
  value = local.descriptions
}
```

### Step 7: Create `terraform.tfvars` File

Define values for the variables in a `terraform.tfvars` file:

```hcl
ages = [10, 15, 20, 25, 30, 35, 40]

people = [
  { name = "Alice", age = 28 },
  { name = "Bob", age = 34 },
  { name = "Charlie", age = 25 }
]
```

