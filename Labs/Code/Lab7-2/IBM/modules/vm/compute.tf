resource "ibm_is_instance" "my_vm" {
  name    = "mycompute"
  vpc     = var.vpc_id
  zone    = "us-south-1"
  image   = var.vm_image
  tags = ["source:vm module"]


profile = var.vm_profile
  

  primary_network_interface {
    subnet = var.subnet_id
  }

  keys = [
    var.keys_id
  ]
}
