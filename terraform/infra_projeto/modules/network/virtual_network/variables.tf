variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  validation {
    condition     = length(var.resource_group_name) > 0
    error_message = "The Resource Group name cannot be empty."
  }
}

variable "resource_group_location" {
  description = "The location of the resource group."
  type        = string
  validation {
    condition     = length(var.resource_group_location) > 0
    error_message = "The Resource Group location cannot be empty."
  }
}

variable "name_virtual_network" {
  description = "The name of the virtual network."
  type        = string
  validation {
    condition     = length(var.name_virtual_network) > 0
    error_message = "The virtual network name cannot be empty."
  }
}

variable "address_space" {
  description = "The address space of the virtual network."
  type        = list(string)
  validation {
    condition     = length(var.address_space) > 0
    error_message = "The address space cannot be empty."
  }
}

variable "dns_servers" {
  description = "List of DNS servers to use with the virtual network."
  type        = list(string)
  validation {
    condition     = length(var.dns_servers) > 0
    error_message = "At least one DNS server must be provided."
  }
}

variable "subnets" {
  description = "A list of subnets to create within the virtual network."
  type = list(object({
    name             = string
    address_prefixes = list(string)
  }))
  validation {
    condition     = length(var.subnets) > 0
    error_message = "At least one subnet must be defined."
  }
}

variable "tags" {
  description = "Tags to be used."
  type        = map(string)
  default     = {}
}
