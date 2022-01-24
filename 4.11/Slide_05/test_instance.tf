resource "oci_core_instance" "test_instance" {
  count = var.is_free == true ? 1 : 3

  #Required
  availability_domain = var.instance_availability_domain[0]
  compartment_id      = var.compartment_id
  #shape               = var.is_free ? var.instance_shape["always_free"] : var.instance_shape["small"]
  shape = var.is_production ? var.is_database ? var.instance_shape["extra_large"] : var.instance_shape["large"] : var.is_free ? var.instance_shape["always_free"] : var.instance_shape["small"]
  #hostname_label = "my-server-${count.index}"

  create_vnic_details {
    subnet_id = oci_core_subnet.test_subnet.id
    #hostname_label = var.instance_hostname_label
    hostname_label = "my-server-${count.index}"
  }

  source_details {
    source_id   = var.image_OL8_x64
    source_type = "image"
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
  }

  freeform_tags = local.acme_tags
}
