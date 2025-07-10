output "kubernetes_name" {
  description = "The name of the Kubernetes cluster."
  value       = azurerm_kubernetes_cluster.aks-tf.name
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks-tf.kube_config_raw
  sensitive = true
}

/*
Como Usar os Outputs:
terraform output <nome_do_output>
*/