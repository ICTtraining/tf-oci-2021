resource "oci_core_instance" "test_instance" {
    #Required
    availability_domain = var.instance_availability_domain
    compartment_id = var.compartment_id
    shape = var.instance_shape

    create_vnic_details {
        subnet_id = oci_core_subnet.test_subnet.id
    }

    source_details {
        #Required
        source_id = var.image_OL8_x64
        source_type = "image"
    }
}