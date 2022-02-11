resource "oci_core_security_list" "test_security_list" {
    #Required
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.test_vcn.id
    display_name = "Empty_Security_List"
}