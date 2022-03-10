data "terraform_remote_state" "tfbackend_network" {
  backend = "local"

  config = {
    path = "../network/terraform.tfstate"
  }
}


data "oci_identity_availability_domains" "test_availability_domains" {
  #Required
  compartment_id = data.terraform_remote_state.tfbackend_network.outputs.compartment_id
}
