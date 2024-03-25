resource "ibm_is_instance" "X" {
  name    = "myvmx"
  vpc     = ibm_is_vpc.my_vpc.id
  zone    = "us-south-1"
  image   = "r006-f259b449-f3d4-4924-8d67-61201f728068"
  resource_group = ibm_resource_group.my_rg.id
  tags = ["VM X"]
 
  profile = "bx2-2x8"
 

  primary_network_interface {
    subnet = ibm_is_subnet.my_subnet.id
  }

  keys = [
    ibm_is_ssh_key.my_ssh_key.id
  ]
}

resource "ibm_is_instance" "Y" {
  name    = "myvmy"
  vpc     = ibm_is_vpc.my_vpc.id
  zone    = "us-south-1"
  image   = "r006-f259b449-f3d4-4924-8d67-61201f728068"
  resource_group = ibm_resource_group.my_rg.id
  tags = ["VM Y"]
 
  profile = "bx2-2x8"
  

  primary_network_interface {
    subnet = ibm_is_subnet.my_subnet.id
  }

  keys = [
    ibm_is_ssh_key.my_ssh_key.id
  ]
}
