resource "oci_core_instance" "test_instance_2" {
  #Required
  availability_domain = var.instance_availability_domain[0]
  compartment_id      = var.compartment_id
  shape               = var.instance_shape["always_free"]
  hostname_label      = var.instance_hostname_label_2

  create_vnic_details {
    subnet_id      = oci_core_subnet.test_subnet.id
    hostname_label = var.instance_hostname_label_2
  }

  source_details {
    source_id   = var.image_OL8_x64
    source_type = "image"
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
  }
}
