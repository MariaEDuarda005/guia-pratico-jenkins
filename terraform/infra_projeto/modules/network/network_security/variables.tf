variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "resource_group_location" {
  description = "The location of the resource group."
  type        = string
}

variable "nsg_name" {
  description = "The name of the network security group"
  type        = string
}

variable "network_interface_id" {
  description = "The ID of the network interface"
  type        = string
}

variable "network_security_group_id" {
  description = "The ID of the network security group"
  type        = string
}

variable "tags" {
  description = "Tags to be used."
  type        = map(string)
  default     = {}
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type = string
  validation {
    condition = length(var.subnet_id) > 0
    error_message = "The ID of the subnet cannot be empty"
  }
}