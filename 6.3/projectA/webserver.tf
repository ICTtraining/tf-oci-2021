module "webserver-A" {
    source = "../modules/arm_instance/"
    #version = "~> 1.0"
}

variable hostname_label {
    default = "www"
}