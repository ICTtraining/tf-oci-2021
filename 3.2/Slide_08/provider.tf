#terraform {
#  required_providers {
#    oci = {
#      source = "hashicorp/oci"
#      version = "4.57.0"
#    }
#  }
#}

provider "oci" {
  # Configuration options
}

terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.16.0"
    }
  }
}

provider "digitalocean" {
  # Configuration options
}