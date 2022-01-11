variable "route_table_display_name" {
    default = "Route test VCN to test IGW"
}

variable "route_table_route_rules_destination" {
    default = "0.0.0.0/0"
}

variable "route_table_route_rules_destination_type" {
    default = "CIDR_BLOCK"
}

resource "oci_core_route_table" "test_route_table" {
    #Required
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.test_vcn.id

    #Optional
    display_name = var.route_table_display_name
    route_rules {
        #Required
        network_entity_id = oci_core_internet_gateway.test_internet_gateway.id

        #Optional
        destination = var.route_table_route_rules_destination
        destination_type = var.route_table_route_rules_destination_type
    }
}