resource "oci_core_vcn" "test_vcn" {
    #Required
    #compartment_id = var.compartment_id
    compartment_id = var.tenancy_ocid
    #cidr_blocks = var.vcn_cidr_blocks
    cidr_blocks = ["10.0.0.0/16",
                   "10.1.0.0/16",
                   "10.2.0.0/16"]
}