output "sshkeyid" {
    description = "Id of ssh key"
    value = ibm_is_ssh_key.my_ssh_key.id
}