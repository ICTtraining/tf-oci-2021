terraform {
  required_providers {
    oci = {
      source = "hashicorp/oci"
      #version = "4.57.0"
      #version = "4.56.0"
      version = " ~> 3.0"
    }
   }
}

provider "oci" {
  # Configuration options
  config_file_profile= var.config_file_profile
  #tenancy_ocid = "ocid1.tenancy.oc1..aaaaaaaaixxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  #region = "eu-marseille-1"
}

