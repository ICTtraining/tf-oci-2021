variable "instance_availability_domain" {
    default = "xRjI:EU-FRANKFURT-1-AD-1"
    description = "AD1"
}

variable "instance_shape" {
    #default = "VM.Standard2.1"
    default = "VM.Standard.E2.1.Micro"
}

resource "oci_core_instance" "test_instance" {
    #Required
    availability_domain = var.instance_availability_domain
    compartment_id = var.compartment_id
    shape = var.instance_shape
}