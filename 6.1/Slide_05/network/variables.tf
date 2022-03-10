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

// Security List

variable "ports_ingress" {
  type        = list(number)
  default     = []
  description = "The list of ports which should be open on the firewall"
}
