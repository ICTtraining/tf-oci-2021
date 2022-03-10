locals {
  compartment_id = data.terraform_remote_state.tfbackend_network.outputs.compartment_id
  vcn_id         = data.terraform_remote_state.tfbackend_network.outputs.vcn_id
  subnet_id      = data.terraform_remote_state.tfbackend_network.outputs.subnet_id
}

locals {
  acme_tags = {
    "Department"    = "Hosting"
    "Customer"      = "ACME GmbH"
    "SPOC"          = "Max Mustermann"
    "CostCenter"    = "08154711"
    "BillingPeriod" = "monthly"
    "Terraform"     = true
  }

  list_of_ads   = data.oci_identity_availability_domains.test_availability_domains.availability_domains[*].name
  number_of_ads = length(local.list_of_ads)
}

locals {
  nsg_ingress_tcp_ports = {
    "http_apache" = {
      "Min" = 80
      "Max" = 80
    },
    "https_apache" = {
      "Min" = 443
      "Max" = 443
    },
    "http_tomcat" = {
      "Min" = 8080
      "Max" = 8081
    }
  }
}