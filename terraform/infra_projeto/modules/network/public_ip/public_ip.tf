resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name # "terraform-public-ip"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  allocation_method   = var.sku == "Standard" ? "Static" : var.allocation_method # Se o SKU for Standard, aloca como Static
  sku                 = var.sku                                                  # "Standard"
}