terraform {
  required_providers {
    oci = {
      source = "hashicorp/oci"
      version = "4.57.0"
    }
    github = {
      source = "integrations/github"
      version = "4.19.0"
    }
  }
}

provider "oci" {
  # Configuration options
  config_file_profile= var.config_file_profile
  #tenancy_ocid = "ocid1.tenancy.oc1..aaaaaaaaixxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  #region = "eu-marseille-1"
}

provider "github" {
  # Configuration options
  token = "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"  # replace with your own token
}

