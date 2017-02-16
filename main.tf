resource "azurerm_virtual_network" "network" {
  name = "${var.network_name}"
  address_space = [ "${var.network_addr_space}" ]
  resource_group_name = "${var.rgroup_name}"
  location = "${var.location}"
}

resource "azurerm_subnet" "pub" {
  count = "${var.pub_subnet_num}"
  name = "${var.network_name}-pub${count.index}"
  resource_group_name = "${var.rgroup_name}"
  virtual_network_name = "${azurerm_virtual_network.network.name}"
  address_prefix = "${cidrsubnet(var.network_addr_space, var.subnet_bit, count.index)}"
}

resource "azurerm_subnet" "priv" {
  count = "${var.priv_subnet_num}"
  name = "${var.network_name}-priv${count.index}"
  resource_group_name = "${var.rgroup_name}"
  virtual_network_name = "${azurerm_virtual_network.network.name}"
  address_prefix = "${cidrsubnet(var.network_addr_space, var.subnet_bit, count.index + var.pub_subnet_num)}"
}
