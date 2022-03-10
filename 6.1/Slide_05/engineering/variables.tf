//NSGs
variable "network_security_group_display_name" {
  type        = string
  default     = "nsg_bastion"
  description = "The displayed name of a Network Security Group"
}

//Availability Domain
variable "instance_availability_domain" {
  type = list(string)
  default = ["xRjI:EU-FRANKFURT-1-AD-1",
    "xRjI:EU-FRANKFURT-1-AD-2",
  "xRjI:EU-FRANKFURT-1-AD-3"]
  description = "The Availability Domain"
}

//OS Image
variable "image_OL8_x64" {
  type = map(string)
  default = {
    eu-amsterdam-1 = "ocid1.image.oc1.eu-amsterdam-1.aaaaaaaa5iucvph4gjebjfwu3xaaabmttn5cwsmudlofdqe33lstmpwi2ama"
    eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaahnokcgsxs2tyk2uka6aogvexizg3n2v4puqmrbn5d2thaf4bms3q"
    eu-zurich-1    = "ocid1.image.oc1.eu-zurich-1.aaaaaaaa3dyvucq2ux65mts7a4k7befvm7kdhn5snt7syxrxc4gjcprh2kha"
  }
  description = "Oracle-Linux-8.5-2021.12.08-0"
}

variable "image_OL8_aarch64" {
  type = map(string)
  default = {
    eu-amsterdam-1 = "ocid1.image.oc1.eu-amsterdam-1.aaaaaaaadixwulpfjs4yqwhnzjorjmxaalrlwmma35nntqdkvmd6zu76fuaq"
    eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaaz2r47fffxh4gqvy5lmfednw4qdeyhin6tkhcossmps2mrazelczq"
    eu-zurich-1    = "ocid1.image.oc1.eu-zurich-1.aaaaaaaa4sbb4pkjghfxr5buwkokck6ofsna2lvg6pa3ff3wbif4qwhqroiq"
  }
  description = "Oracle-Linux-8.5-aarch64-2021.12.14-0"
}

// Region
variable "region" {
  type        = string
  default     = "eu-frankfurt-1"
  description = "The region where I deploy my infrastructure"

  validation {
    condition = (
      length(var.region) >= 8 &&
      substr(var.region, 0, 3) == "eu-"
    )
    error_message = "The region must be inside Europe and start with \"eu-\"."
  }
}

//Server
variable "arm_instance_shape" {
  type        = string
  default     = "VM.Standard.A1.Flex"
  description = "The Flexible ARM-Based Compute Shape"
}

variable "arm_ocpus" {
  type = map(string)
  default = {
    always_free = "1"
    small       = "4"
    medium      = "8"
    large       = "32"
    extra_large = "64"
  }
  description = "The number of OCPUs per instance"
}

variable "arm_memory" {
  type = map(string)
  default = {
    always_free = "6"
    small       = "32"
    medium      = "128"
    large       = "256"
    extra_large = "512"
  }
  description = "The amount of memory in GB per instance"
}

