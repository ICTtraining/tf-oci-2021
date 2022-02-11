resource "oci_core_security_list" "test_security_list" {
  #Required
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.test_vcn.id
  display_name   = "Empty_Security_List"

  // allow outbound tcp traffic on all ports
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "6"
  }

  dynamic "ingress_security_rules" {
    for_each = var.ports_ingress

    content {
      protocol  = "6" // tcp
      source    = "0.0.0.0/0"
      stateless = false

      tcp_options {
        // These values correspond to the destination port range.
        min = ingress_security_rules.value
        max = ingress_security_rules.value
      }
    }
  }

}
