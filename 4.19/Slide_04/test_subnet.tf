resource "oci_core_subnet" "test_subnet" {
  #Required
  cidr_block        = var.test_subnet_cidr_block
  compartment_id    = var.compartment_id
  vcn_id            = oci_core_vcn.test_vcn.id
  dns_label         = var.subnet_dns_label
  route_table_id    = oci_core_vcn.test_vcn.default_route_table_id
  security_list_ids = [oci_core_vcn.test_vcn.default_security_list_id]
  dhcp_options_id   = oci_core_vcn.test_vcn.default_dhcp_options_id

  freeform_tags = local.acme_tags
}
