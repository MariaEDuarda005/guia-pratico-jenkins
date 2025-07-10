resource "azurerm_virtual_network" "vnet" {
  name                = var.name_virtual_network
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  address_space       = var.address_space
  dns_servers         = var.dns_servers

  dynamic "subnet" {
    for_each = var.subnets
    content {
      name             = subnet.value["name"]
      address_prefixes = subnet.value["address_prefixes"]
    }
  }

  tags = var.tags

}