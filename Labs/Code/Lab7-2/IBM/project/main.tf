
module "vm" {
    source = "../modules/vm"
    vm_image = var.vm_image
    vm_profile = var.vm_profile
    subnet_id = module.vpc.subnetid
    keys_id = module.keys.sshkeyid
    vpc_id = module.vpc.vpcid

}

module "keys" {
    source = "../modules/ssh_keys"
}

module "vpc" {
    source = "../modules/vpc"
}
