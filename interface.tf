variable "location" {}
variable "network_addr_space" {}
variable "network_name" {}
variable "priv_subnet_num" {}
variable "pub_subnet_num" {}
variable "rgroup_name" {}
variable "subnet_bit" {}


output "network_id" { value = "${azurerm_virtual_network.network.id}" }
output "network_name" { value = "${var.network_name}" }
output "priv_subnets" { value = ["${azurerm_subnet.priv.*.id}"] }
output "pub_subnets" { value = ["${azurerm_subnet.pub.*.id}"] }
