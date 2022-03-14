variable "hostname_label" {
  type        = string
  default     = "untitled"
  description = "The hostname of the primary VNIC"
}

variable "server_size" {
  type        = string
  default     = "always_free"
  description = "The T-Shirt size of the compute instance"

  validation {
    condition = (
      var.server_size == "always_free" ||
      var.server_size == "small"       ||
      var.server_size == "medium"      ||
      var.server_size == "large"       ||
      var.server_size == "extra_large"
    )
    error_message = "The server size must be one of the official T-shirt sizes as defined by Compliance."
  }
}

variable "ssh_public_key_path" {
  type        = string
  default     = "~/.ssh/id_rsa.pub"
  description = "The path to the default SSH public key"
}

variable "config_file_profile" {
  default     = "TRAINING"
  description = "The profile in ~/.oci/config which shall be used"
}