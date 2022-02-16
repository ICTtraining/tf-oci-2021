locals {
  acme_tags = {
    "Department"    = "Hosting"
    "Customer"      = "ACME GmbH"
    "SPOC"          = "Max Mustermann"
    "CostCenter"    = "08154711"
    "BillingPeriod" = "monthly"
    "Terraform"     = true
  }

  is_database = var.is_database ? var.instance_shape["extra_large"] : var.instance_shape["large"]

  is_development = var.is_free ? var.instance_shape["always_free"] : var.instance_shape["small"]

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
    },
  }
}

locals {
  portlist = ["80","443","8080","8081","8443"]
}