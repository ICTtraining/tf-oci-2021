variable vcn_dns_label {
    default = "training"
}

resource "oci_core_vcn" "test_vcn" {
    #Required
    compartment_id = var.compartment_id
    #cidr_blocks = var.vcn_cidr_blocks
    cidr_blocks = ["10.0.0.0/16",
                   "10.1.0.0/16",
                   "10.2.0.0/16"]
    display_name = var.vcn_dns_label
    dns_label = var.vcn_dns_label               
}