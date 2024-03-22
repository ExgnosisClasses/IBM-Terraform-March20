output "subnetid" {
    description = "Id of subnet"
    value = ibm_is_subnet.my_subnet.id
}

output "vpcid" {
    description = "Id of vpc"
    value = ibm_is_vpc.my_vpc.id
}