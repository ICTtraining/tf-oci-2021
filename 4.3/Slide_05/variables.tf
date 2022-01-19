// VCN
variable vcn_cidr_blocks {
    default = ["10.0.0.0/16",
               "10.1.0.0/16"]
}

variable vcn_dns_label {
    default = "training"
}

variable "internet_gateway_display_name" {
    default = "My Training IGW"
}

variable "internet_gateway_enabled" {
    default = "true"
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

//OS Image
variable "image_OL8_x64" {
    default = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaahnokcgsxs2tyk2uka6aogvexizg3n2v4puqmrbn5d2thaf4bms3q"
    description = "Oracle-Linux-8.5-2021.12.08-0"
}

//Server
variable instance_shape {
    default = "VM.Standard.E2.1.Micro"
    description = "Always Free shape, paid accounts use VM.Standard2.1 instead"
}

variable instance_hostname_label {
    default = "my-server"
}