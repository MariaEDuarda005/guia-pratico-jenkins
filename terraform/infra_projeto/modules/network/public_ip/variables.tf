variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "resource_group_location" {
  description = "The location of the resource group."
  type        = string
}

variable "public_ip_name" {
  description = "The name of the public IP"
  type        = string
}

variable "allocation_method" {
  description = "The allocation method for the public IP"
  type        = string
}

variable "sku" {
  description = "The type of the sku"
  type        = string
  default     = "Standard"
}