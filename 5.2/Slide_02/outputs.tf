output "my_test_instance" {
  value = oci_core_instance.test_instance[*].public_ip
}

#output "my_ARM_instances" {
#  value = oci_core_instance.arm_instance[*].public_ip
#}

#output "ARM_display_names" {
#  value = oci_core_instance.arm_instance[*].display_name
#}

output "ARM_serverlist" {
  value = zipmap(oci_core_instance.arm_instance[*].display_name, oci_core_instance.arm_instance[*].public_ip)
}