resource "azurerm_linux_virtual_machine" "vm-tf" {
  name                = var.virtual_machine_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  size                = var.size
  admin_username      = var.admin_username

  network_interface_ids = [
    var.network_interface_id
  ]

  # Definindo a senha do admin
  admin_password = var.admin_password

  os_disk {
    caching              = var.caching
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.version_image
  }

  disable_password_authentication = var.password_authentication

}

resource "azurerm_role_assignment" "vm_admin_login" {
  scope                = var.resource_group_id
  role_definition_name = "Virtual Machine Administrator Login"
  principal_id         = var.user_object_id 
}
