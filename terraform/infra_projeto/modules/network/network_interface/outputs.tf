output "network_interface_name" {
  description = "The name of the network interface."
  value       = azurerm_network_interface.ni-tf.name
}

output "network_interface_id" {
  description = "The ID of the network interface."
  value       = azurerm_network_interface.ni-tf.id
}

output "virtual_machine_private_ip" {
  description = "The private IP address of the virtual machine."
  value       = azurerm_network_interface.ni-tf.ip_configuration[0].private_ip_address
}