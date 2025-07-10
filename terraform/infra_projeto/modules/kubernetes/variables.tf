variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  validation {
    condition     = length(var.resource_group_name) > 0
    error_message = "Resource group name must not be empty."
  }
}

variable "resource_group_location" {
  description = "The location of the resource group."
  type        = string
  validation {
    condition     = length(var.resource_group_location) > 0
    error_message = "Resource group location must not be empty."
  }
}

variable "kubernetes_name" {
  description = "The name of the Kubernetes cluster."
  type        = string
  validation {
    condition     = length(var.kubernetes_name) > 0
    error_message = "The Kubernetes cluster name must be 1-63 characters, letters, numbers, or hyphens only."
  }
}

variable "kubernetes_version" {
  description = "The AKS cluster Kubernetes version."
  type        = string
  default     = "1.30.12"
  validation {
    condition     = length(var.kubernetes_version) > 0
    error_message = "The AKS cluster Kubernetes version cannot be empty."
  }
}

variable "kubernetes_dns_prefix" {
  description = "The DNS prefix for the Kubernetes cluster."
  type        = string
  validation {
    condition     = length(var.kubernetes_dns_prefix) > 0
    error_message = "The DNS prefix must be lowercase, 3-45 characters, and contain only letters and numbers."
  }
}

variable "name_default_node_pool" {
  description = "The name of the default node pool."
  type        = string
  default     = "default"
  validation {
    condition     = length(var.name_default_node_pool) > 0
    error_message = "The node pool name must be lowercase, 1-12 characters, and contain only letters and numbers."
  }
}

variable "node_count" {
  description = "The number of nodes in the default node pool."
  type        = number
  default     = 1
  validation {
    condition     = var.node_count >= 1 && var.node_count <= 100
    error_message = "Node count must be between 1 and 100."
  }
}

variable "vm_size" {
  description = "The size of the virtual machines in the default node pool."
  type        = string
  default     = "Standard_D2_v2"
  validation {
    condition     = length(var.vm_size) > 0
    error_message = "VM size must not be empty."
  }
}

variable "identity_type" {
  description = "The type of the identity for the Kubernetes cluster."
  type        = string
  default     = "SystemAssigned"
  validation {
    condition     = length(var.identity_type) > 0
    error_message = "The identity type must be 'SystemAssigned' or 'UserAssigned'."
  }
}

variable "node_labels" {
  description = "A map of labels to apply to the nodes in the default node pool."
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Tags to be used."
  type        = map(string)
  default     = {}
}