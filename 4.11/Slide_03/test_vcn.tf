resource "oci_core_vcn" "test_vcn" {
  #Required
  compartment_id = var.compartment_id
  #cidr_blocks = var.vcn_cidr_blocks
  cidr_blocks = var.vcn_cidr_blocks
  dns_label   = var.vcn_dns_label

  freeform_tags = {
    "Department"    = "Hosting"
    "Customer"      = "ACME GmbH"
    "SPOC"          = "Max Mustermann"
    "CostCenter"    = "08154711"
    "BillingPeriod" = "monthly"
    "Terraform"     = true
  }
}
