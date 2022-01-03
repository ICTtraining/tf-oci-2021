terraform {
  required_providers {
    oci = {
      source = "hashicorp/oci"
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

