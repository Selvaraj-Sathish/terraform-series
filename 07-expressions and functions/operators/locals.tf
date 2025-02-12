locals {
  math       = 7 * 5
  equal      = 5 != 3
  comparison = 3 <= 2
  logical    = !false

}

output "operators" {
  value = {
    math       = local.math
    equal      = local.equal
    comparison = local.comparison
    logical    = local.logical
  }
}
