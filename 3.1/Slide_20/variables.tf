// VCN
variable vcn_cidr_blocks {
    default = ["10.0.0.0/16",
               "10.1.0.0/16"]
}

variable vcn_dns_label {
    default = "training"
}