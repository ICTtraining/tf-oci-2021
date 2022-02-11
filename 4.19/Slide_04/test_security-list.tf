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

  // allow inbound https traffic on port 443
  ingress_security_rules {
    protocol  = "6" // tcp
    source    = "0.0.0.0/0"
    stateless = false

    tcp_options {
      // These values correspond to the destination port range.
      min = 443
      max = 443
    }
  }

  // allow inbound http(s) traffic on ports 8080 and 8081
  ingress_security_rules {
    protocol  = "6" // tcp
    source    = "0.0.0.0/0"
    stateless = false

    tcp_options {
      // These values correspond to the destination port range.
      min = 8080
      max = 8081
    }
  }
}
