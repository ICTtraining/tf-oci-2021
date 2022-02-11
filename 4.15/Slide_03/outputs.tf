output "my_test_instance" {
  value = oci_core_instance.test_instance[*].public_ip
}

output "availability_domains" {
  value = data.oci_identity_availability_domains.test_availability_domains.availability_domains[*].name
}
