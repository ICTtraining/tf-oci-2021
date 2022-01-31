locals {
  acme_tags = {
    "Department"    = "Hosting"
    "Customer"      = "ACME GmbH"
    "SPOC"          = "Max Mustermann"
    "CostCenter"    = "08154711"
    "BillingPeriod" = "monthly"
    "Terraform"     = true
  }

  is_database = var.is_database ? var.instance_shape["extra_large"] : var.instance_shape["large"]

  is_development = var.is_free ? var.instance_shape["always_free"] : var.instance_shape["small"]
}
