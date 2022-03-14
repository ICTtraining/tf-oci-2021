resource "oci_core_network_security_group" "my" {
  #Required
  #compartment_id = var.compartment_id
  compartment_id = local.compartment_id
  #vcn_id         = oci_core_vcn.test_vcn.id
  vcn_id = local.vcn_id
  #Optional
  display_name = var.network_security_group_display_name

  freeform_tags = local.acme_tags
}

resource "oci_core_network_security_group_security_rule" "nsg_rules_ingress_tcp" {
  for_each                  = local.nsg_ingress_tcp_ports
  network_security_group_id = oci_core_network_security_group.my.id
  direction                 = "INGRESS"
  protocol                  = "6" # 6 = tcp
  source                    = "0.0.0.0/0"
  source_type               = "CIDR_BLOCK"

  tcp_options {
    destination_port_range {
      max = each.value["Max"]
      min = each.value["Min"]
    }
  }
}


