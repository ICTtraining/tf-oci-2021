// VCN
variable vcn_cidr_blocks {
    default = ["10.0.0.0/16",
               "10.1.0.0/16"]
}

variable vcn_dns_label {
    default = "training"
}

//Subnet
variable subnet_cidr_block {
    default = "10.0.1.0/24"
}

variable subnet_dns_label {
    default = "bastion"
}

//Availability Domain
variable instance_availability_domain {
    default = "xRjI:EU-FRANKFURT-1-AD-1"
}