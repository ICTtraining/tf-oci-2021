variable "instance_availability_domain" {
    default = "xRjI:EU-FRANKFURT-1-AD-1"
    description = "AD1"
}

variable "instance_shape" {
    default = "VM.Standard2.1"
}

resource "oci_core_instance" "test_instance" {
    #Required
    availability_domain = var.instance_availability_domain
    #compartment_id = var.compartment_id
    compartment_id = var.tenancy_ocid
    shape = var.instance_shape

    create_vnic_details {
        subnet_id = oci_core_subnet.test_subnet.id
    }
}