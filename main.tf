variable "location" {}
variable "network_addr_space" {}
variable "network_name" {}
variable "pub_subnet_num" {}
variable "rgroup_name" {}
variable "subnet_bit" {}

resource "azurerm_virtual_network" "network" {
  name = "${var.network_name}"
  address_space = [ "${var.network_addr_space}" ]
  resource_group_name = "${var.rgroup_name}"
  location = "${var.location}"
}

resource "azurerm_route_table" "pub" {
  name = "${var.network_name}-pubrt"
  resource_group_name = "${var.rgroup_name}"
  location = "${var.location}"
  route {
    name = "inet"
    address_prefix = "*"
    next_hop_type = "internet"
  }
}

resource "azurerm_subnet" "pub" {
  count = "${var.pub_subnet_num}"
  name = "${var.network_name}-pub${count.index}"
  resource_group_name = "${var.rgroup_name}"
  virtual_network_name = "${azurerm_virtual_network.network.name}"
  address_prefix = "${cidrsubnet(var.network_addr_space, var.subnet_bit, count.index)}"
  route_table_id = "${azurerm_route_table.pub.id}"
}

output "network_id" { value = "${azurerm_virtual_network.network.id}" }
output "pub_subnets" { type = "list" value = ["${azurerm_subnet.pub.*.id}]" }
