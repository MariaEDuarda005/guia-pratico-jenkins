output "virtual_machine_name" {
  description = "The name of the virtual machine."
  value       = azurerm_linux_virtual_machine.vm-tf.name
}

output "virtual_machine_id" {
  description = "The ID of the virtual machine."
  value       = azurerm_linux_virtual_machine.vm-tf.id
}

output "resource_group_name" {
  description = "The name of the resource group for the virtual machine."
  value       = azurerm_linux_virtual_machine.vm-tf.resource_group_name
}

output "virtual_machine_location" {
  description = "The location of the virtual machine."
  value       = azurerm_linux_virtual_machine.vm-tf.location
}


