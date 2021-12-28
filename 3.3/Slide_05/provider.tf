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
}

provider "github" {
  # Configuration options
}

