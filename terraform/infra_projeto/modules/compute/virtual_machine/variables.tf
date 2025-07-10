variable "virtual_machine_name" {
  description = "The name of the virtual machine."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "resource_group_location" {
  description = "The location of the resource group."
  type        = string
}

variable "size" {
  description = "The size of the virtual machine."
  type        = string
}

variable "admin_username" {
  description = "The admin username for the virtual machine."
  type        = string
}

variable "admin_password" {
  description = "The password for the admin user"
  type        = string
  sensitive   = true
}

variable "network_interface_id" {
  description = "The ID of the network interface."
  type        = string
}

variable "caching" {
  description = "The caching behavior for the OS disk."
  type        = string
  default     = "ReadWrite"
}

variable "storage_account_type" {
  description = "The storage account type for the OS disk."
  type        = string
  default     = "Standard_LRS"
}

variable "publisher" {
  description = "The publisher of the OS image."
  type        = string
  default     = "Canonical"
}

variable "offer" {
  description = "The offer of the OS image."
  type        = string
}

variable "sku" {
  description = "The SKU of the OS image."
  type        = string
}

variable "version_image" {
  description = "The version of the OS image."
  type        = string
}

variable "password_authentication" {
  description = "Disable password authentication"
  type        = bool
  default     = false
}


variable "user_object_id" {
  description = "Object ID do usuário que receberá permissão para login na VM via RBAC"
  type        = string
}

variable "resource_group_id" {
  description = "The ID of the resource group"
  type        = string 
}