output "compartment_id" {
    value = var.compartment_id
    description = "The OCID of the compartment in which this network has been provisioned"
    sensitive = true
}

output "vcn_id" {
    value = oci_core_vcn.test_vcn.id
    description = "The OCID of our Training VCN. Provision your test infrastructure here"
}

output "subnet_id" {
    value = oci_core_subnet.test_subnet.id
    description = "The OCID of our Training subnet. Provision your training compute instances here"
}