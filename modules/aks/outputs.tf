## Names of resources ##

output "resource_group_name" {
  value       = azurerm_resource_group.rg.name
  sensitive   = false
  description = "The name of the resource group where resources were created."
}

output "aks_name" {
  value       = azurerm_kubernetes_cluster.aks.name
  sensitive   = false
  description = "The name of the Azure Kubernetes Service (AKS) resource provisioned."
}

output "acr_name" {
  value       = azurerm_container_registry.acr.name
  sensitive   = false
  description = "The name of the Azure Container Registry (ACR) provisioned."
  depends_on  = []
}

## Sensitive ##

output "client_key" {
  value       = azurerm_kubernetes_cluster.aks.kube_config[0].client_key
  description = "The client key associated with the client certificate."
  sensitive   = true
}

output "cluster_ca_certificate" {
  value       = azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate
  description = "The Certificate Authority (CA) certificate for the Kubernetes API server."
  sensitive   = true
}

output "aks_api_server_endpoint" {
  value       = azurerm_kubernetes_cluster.aks.kube_config[0].host
  description = "The endpoint of the Kubernetes API server."
  sensitive   = true
}

output "cluster_password" {
  value       = azurerm_kubernetes_cluster.aks.kube_config[0].password
  description = "The password used in Basic authentication to access the Kubernetes API server."
  sensitive   = true
}

output "cluster_username" {
  value       = azurerm_kubernetes_cluster.aks.kube_config[0].username
  description = "The username used in Basic authentication to access the Kubernetes API server."
  sensitive   = true
}

output "kube_config" {
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  description = "The raw Kubernetes configuration, kube_config, used to access the cluster."
  sensitive   = true
}
