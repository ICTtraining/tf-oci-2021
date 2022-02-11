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

  list_of_ads   = data.oci_identity_availability_domains.test_availability_domains.availability_domains[*].name
  number_of_ads = length(local.list_of_ads)
}
