# Resource Group
output "resource_group_name" {
  description = "The name of the resource group."
  value       = module.azurerg.resource_group_name
}

output "resource_group_location" {
  description = "The location of the resource group."
  value       = module.azurerg.resource_group_location
}

output "resource_group_id" {
  description = "The ID of the resource group."
  value       = module.azurerg.resource_group_id
}

# Virtual machine
output "virtual_machine_name" {
  description = "The name of the virtual machine."
  value       = module.virtual_machine.virtual_machine_name
}

output "virtual_machine_id" {
  description = "The ID of the virtual machine."
  value       = module.virtual_machine.virtual_machine_id
}

output "virtual_machine_location" {
  description = "The location of the virtual machine."
  value       = module.virtual_machine.virtual_machine_location
}

# Network Interface
output "network_interface_name" {
  description = "The name of the network interface."
  value       = module.network_interface.network_interface_name
}

output "network_interface_id" {
  description = "The ID of the network interface."
  value       = module.network_interface.network_interface_id
}

output "virtual_machine_private_ip" {
  description = "The private IP address of the virtual machine."
  value       = module.network_interface.virtual_machine_private_ip
}

# Network security
output "nsg_id" {
  description = "The ID of the network security group."
  value       = module.network_security.nsg_id
}

# Public Ip
output "id_public_ip" {
  value = module.public_ip.id_public_ip
}

# Virtual Network
output "subnet_ids" {
  description = "The IDs of the subnets in the virtual network."
  value       = module.virtual_network.subnet_ids
}

output "vnet_id" {
  description = "The ID of the virtual network."
  value       = module.virtual_network.vnet_id
}

# aks
output "kube_config" {
  value     = module.kubernetes.kube_config
  sensitive = true
}

output "kubernetes_name" {
  description = "The name of the Kubernetes cluster."
  value       = module.kubernetes.kubernetes_name
}