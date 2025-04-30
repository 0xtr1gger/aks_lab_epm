## Names of resources ##

output "resource_group_name" {
  value       = module.aks.resource_group_name
  sensitive   = false
  description = "The name of the resource group where resources were created."
}

output "aks_name" {
  value       = module.aks.aks_name
  sensitive   = false
  description = "The name of the Azure Kubernetes Service (AKS) resource provisioned."
}

output "acr_name" {
  value       = module.aks.acr_name
  sensitive   = false
  description = "The name of the Azure Container Registry (ACR) provisioned."
  depends_on  = []
}

## Sensitive ##

output "client_key" {
  value       = module.aks.client_key
  description = "The client key associated with the client certificate."
  sensitive   = true
}

output "cluster_ca_certificate" {
  value       = module.aks.cluster_ca_certificate
  description = "The Certificate Authority (CA) certificate for the Kubernetes API server."
  sensitive   = true
}

output "aks_api_server_endpoint" {
  value       = module.aks.aks_api_server_endpoint
  description = "The endpoint of the Kubernetes API server."
  sensitive   = true
}

output "cluster_password" {
  value       = module.aks.cluster_password
  description = "The password used in Basic authentication to access the Kubernetes API server."
  sensitive   = true
}

output "cluster_username" {
  value       = module.aks.cluster_username
  description = "The username used in Basic authentication to access the Kubernetes API server."
  sensitive   = true
}

output "kube_config" {
  value       = module.aks.kube_config
  description = "The raw Kubernetes configuration, kube_config, used to access the cluster."
  sensitive   = true
}
