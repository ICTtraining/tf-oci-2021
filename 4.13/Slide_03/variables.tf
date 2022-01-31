//Tag Namespace
variable "tag_namespace_name" {
  type        = string
  default     = "Training"
  description = "A Namespace for training purposes"
}

variable "tag_namespace_description" {
  type        = string
  default     = "An ephemeral namespace for training"
  description = "The description of the namespace"
}

// VCN
variable "vcn_cidr_blocks" {
  type        = list(string)
  default     = ["10.0.0.0/16", "10.1.0.0/16"]
  description = "A list of up to five IPv4 CIDR ranges"
}

variable "vcn_dns_label" {
  type        = string
  default     = "training"
  description = "The DNS subdomain of the VCN"
}

variable "internet_gateway_display_name" {
  type        = string
  default     = "My Training IGW"
  description = "The displayed name of the Internet Gateway"
}

variable "internet_gateway_enabled" {
  type        = bool
  default     = true
  description = "false deactivates the Internet Gateway"
}

//Subnet
variable "test_subnet_cidr_block" {
  type        = string
  default     = "10.0.1.0/24"
  description = "The IPv4 CIDR range of a given test subnet"
}

variable "subnet_dns_label" {
  type        = string
  default     = "bastion"
  description = "The DNS subdomain of a given subnet"
}

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
#variable "image_OL8_x64" {
#  type        = string
#  default     = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaahnokcgsxs2tyk2uka6aogvexizg3n2v4puqmrbn5d2thaf4bms3q"
#  description = "Oracle-Linux-8.5-2021.12.08-0"
#}
variable "image_OL8_x64" {
  type = map(string)
  default = {
    eu-amsterdam-1 = "ocid1.image.oc1.eu-amsterdam-1.aaaaaaaa5iucvph4gjebjfwu3xaaabmttn5cwsmudlofdqe33lstmpwi2ama"
    eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaahnokcgsxs2tyk2uka6aogvexizg3n2v4puqmrbn5d2thaf4bms3q"
    eu-zurich-1    = "ocid1.image.oc1.eu-zurich-1.aaaaaaaa3dyvucq2ux65mts7a4k7befvm7kdhn5snt7syxrxc4gjcprh2kha"
  }
  description = "Oracle-Linux-8.5-2021.12.08-0"
}

// Region
variable "region" {
  type        = string
  default     = "eu-frankfurt-1"
  description = "The region where I deploy my infrastructure"
}

//Server
variable "instance_shape" {
  type = map(string)
  default = {
    always_free = "VM.Standard.E2.1.Micro"
    small       = "VM.Standard2.1"
    medium      = "VM.Standard2.8"
    large       = "vM.Standard2.16"
    extra_large = "BM.Standard2.52"
  }
  description = "Tailored server sizes"
}

variable "instance_hostname_label" {
  type        = string
  default     = "my-server"
  description = "The hostname of the first VNIC of a given server"
}

variable "is_free" {
  type        = bool
  default     = true
  description = "true deploys only always_free shapes for compute instances"
}

variable "is_production" {
  type        = bool
  default     = false
  description = "Are we provisioning in the production environment?"
}

variable "is_database" {
  type        = bool
  default     = false
  description = "Are we deploying a database server?"
}
