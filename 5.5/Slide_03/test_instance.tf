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
    nsg_ids        = [oci_core_network_security_group.test_network_security_group.id]
  }

  source_details {
    source_id   = lookup(var.image_OL8_x64, var.region, "illegal region!")
    source_type = "image"
  }

  metadata = {
    ssh_authorized_keys = (
      fileexists(var.ssh_authorized_keys_path) ? # If the authorized_keys file exists, then
      file(var.ssh_authorized_keys_path) :       # use this file, else
      (                                          # 
        fileexists(var.ssh_public_key_path) ?    # if the public_key file exists, then
        file(var.ssh_public_key_path) :          # use this file, else
        null                                     # return null
      )
    )
  }

  extended_metadata = {}

  freeform_tags = local.acme_tags

  provisioner "remote-exec" {

    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "opc"
      private_key = file("~/.ssh/passwordless-id_rsa")
    }

    inline = [
      "# OS package installs take a LOT of time and cause server drift -> just for example",
      "# HashiCorp recommends using Packer instead of Terraform for software installations",
      "#sudo dnf update -y",
      "sudo dnf install -y dnf-plugins-core httpd mod_ssl",
      "sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo",
      "sudo dnf install -y vault consul boundary"
    ]
  }

  provisioner "local-exec" {
    when = create
    on_failure = continue
    
    # The following command is a non-working demo only, necessary dependencies are not met
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u opc -i '${self.public_ip},' --private-key ~/.ssh/passwordless-id_rsa apache.yml"
  }

  provisioner "remote-exec" {
    when = destroy
    on_failure = continue

   connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "opc"
      private_key = file("~/.ssh/passwordless-id_rsa")
    }

    inline = [
    "# Uninstall application", 
    "sudo dnf remove -y vault consul boundary",
    "# Flush all filesystem buffers",
    "sudo sync",
    "# Shut down all processes gracefully",
    "sudo shutdown -H now"   # This line provokes an error and next destroy attempt will loop endlessly
    ]
  }
}


