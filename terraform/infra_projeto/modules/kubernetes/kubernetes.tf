resource "azurerm_kubernetes_cluster" "aks-tf" {
  name                = var.kubernetes_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.kubernetes_dns_prefix
  tags                = var.tags
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name                 = var.name_default_node_pool
    node_count           = var.node_count
    vm_size              = var.vm_size
    node_labels          = var.node_labels
  }

  identity {
    type = var.identity_type
  }
}

