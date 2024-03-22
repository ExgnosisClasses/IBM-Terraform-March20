
variable "vm_image" {
    description = "Image used for vm"
    type = string
}

variable "vm_profile" {
    description = "Profile used for vm"
    type = string
}

variable "keys_id" {
    description = "id for ssh keys"
    type = string
}

variable "subnet_id" {
    description = "id of the subnet used"
    type = string
}

variable "vpc_id" {
    description = "id of the vpc used"
    type = string
}

