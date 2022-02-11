resource "oci_core_network_security_group" "test_network_security_group" {
  #Required
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.test_vcn.id

  #Optional
  display_name = var.network_security_group_display_name

  freeform_tags = local.acme_tags
}
