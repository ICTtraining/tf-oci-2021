resource "oci_core_security_list" "test_security_list" {
    compartment_id = var.compartment_id
    display_name   = "Our Terraform Default Security List"
    vcn_id         = oci_core_vcn.test_vcn.id

    egress_security_rules {
        destination      = "0.0.0.0/0"
        destination_type = "CIDR_BLOCK"
        protocol         = "all"
        stateless        = false
    }

    ingress_security_rules {
        protocol    = "1"
        source      = "10.0.0.0/16"
        source_type = "CIDR_BLOCK"
        stateless   = false

        icmp_options {
            code = -1
            type = 3
        }
    }
    ingress_security_rules {
        protocol    = "1"
        source      = "10.1.0.0/16"
        source_type = "CIDR_BLOCK"
        stateless   = false

        icmp_options {
            code = -1
            type = 3
        }
    }
    ingress_security_rules {
        protocol    = "1"
        source      = "10.2.0.0/16"
        source_type = "CIDR_BLOCK"
        stateless   = false

        icmp_options {
            code = -1
            type = 3
        }
    }
    ingress_security_rules {
        protocol    = "1"
        source      = "0.0.0.0/0"
        source_type = "CIDR_BLOCK"
        stateless   = false

        icmp_options {
            code = 4
            type = 3
        }
    }
    ingress_security_rules {
        protocol    = "6"
        source      = "0.0.0.0/0"
        source_type = "CIDR_BLOCK"
        stateless   = false

        tcp_options {
            max = 22
            min = 22
        }
    }
}
