resource "oci_core_instance" "test_instance" {
  count = var.is_free == true ? 1 : 3

  #Required
  availability_domain = local.list_of_ads[count.index % local.number_of_ads]
  compartment_id      = var.compartment_id
  shape               = var.is_production ? local.is_database : local.is_development
  #hostname_label = "my-server-${count.index}"

  create_vnic_details {
    subnet_id      = oci_core_subnet.test_subnet.id
    hostname_label = "my-server-${count.index}"
    nsg_ids = [oci_core_network_security_group.test_network_security_group.id]
  }

  source_details {
    source_id   = lookup(var.image_OL8_x64, var.region, "illegal region!")
    source_type = "image"
  }

  metadata = {
    ssh_authorized_keys = fileexists(var.ssh_public_key_path) ? file(var.ssh_public_key_path) : null
  }

  extended_metadata = {}

  freeform_tags = local.acme_tags
}
