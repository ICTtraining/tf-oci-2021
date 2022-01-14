variable vcn_dns_label {
    default = "training"
}

variable cidr_block_dev {
    default = "10.0.0.0/16"
}

variable cidr_block_bastion {
    default = "10.1.0.0/16"
}

variable cidr_block_web {
    default = "10.2.0.0/16"
}

resource "oci_core_vcn" "test_vcn" {
    #Required
    compartment_id = var.compartment_id
    #cidr_blocks = var.vcn_cidr_blocks
    #cidr_blocks = ["10.0.0.0/16",
    #               "10.1.0.0/16",
    #               "10.2.0.0/16"]
    cidr_blocks = [var.cidr_block_dev,
                   var.cidr_block_bastion,
                   var.cidr_block_web]
    display_name = var.vcn_dns_label
    dns_label = var.vcn_dns_label               
}