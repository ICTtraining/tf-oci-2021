module "homepage-B" {
    source = "../modules/arm_instance/"
    #version = "~> 1.0"
}

variable hostname_label {
    default = "java"
}

variable server_size {
    default = "small"
}