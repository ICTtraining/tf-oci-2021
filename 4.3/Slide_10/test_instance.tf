variable "instance_availability_domain" {
    default = "xRjI:EU-FRANKFURT-1-AD-1"
    description = "AD1"
}

variable "instance_shape" {
    #default = "VM.Standard2.1"
    default = "VM.Standard.E2.1.Micro"
}

variable "image_OL8_x64" {
    default = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaahnokcgsxs2tyk2uka6aogvexizg3n2v4puqmrbn5d2thaf4bms3q"
}

variable "instance_hostname_label" {
    default = "my-server"
}

resource "oci_core_instance" "test_instance" {
    #Required
    availability_domain = var.instance_availability_domain
    compartment_id = var.compartment_id
    shape = var.instance_shape

    #Optional
    display_name = var.instance_hostname_label
    hostname_label = var.instance_hostname_label
   
    create_vnic_details {
        subnet_id = oci_core_subnet.test_subnet.id
    }

    source_details {
        #Required
        #source_id = oci_core_image.test_image.id
        source_id = var.image_OL8_x64
        source_type = "image"
    }
    metadata = {
        ssh_authorized_keys = var.ssh_public_key
  }
}

output "my_test_instance" {
    value = oci_core_instance.test_instance.public_ip
}