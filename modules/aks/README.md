A Terraform module that creates an Azure Kubernetes Service (AKS) and Azure Container Registry (ACR).

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.117.1 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.7.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_container_registry.acr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |
| [azurerm_kubernetes_cluster.aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |
| [azurerm_kubernetes_cluster_node_pool.backend](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [random_pet.aks_cluster_dns_prefix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |
| [random_pet.aks_cluster_name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |
| [random_pet.rg_name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acr_data"></a> [acr\_data](#input\_acr\_data) | description | <pre>object({<br/>    name = string<br/>    sku = string<br/>    admin_enabled = bool<br/>  })</pre> | <pre>{<br/>  "admin_enabled": true,<br/>  "name": "acr-aks-lab-epm",<br/>  "sku": "Basic"<br/>}</pre> | no |
| <a name="input_aks_node_admin_username"></a> [aks\_node\_admin\_username](#input\_aks\_node\_admin\_username) | The name of the admin account on each K8s node. | `string` | `"ansible"` | no |
| <a name="input_aks_node_ssh_key_path"></a> [aks\_node\_ssh\_key\_path](#input\_aks\_node\_ssh\_key\_path) | The path to the public SSH key to put into K8s nodes. | `string` | `"./ssh_keys/id_rsa.pub"` | no |
| <a name="input_backend_pull_data"></a> [backend\_pull\_data](#input\_backend\_pull\_data) | n/a | <pre>object({<br/>      name  = string<br/><br/>      vm_size = string<br/>      os_type = string<br/>      mode = string<br/><br/>      node_count = number<br/><br/>      label = string<br/>      <br/>    })</pre> | <pre>{<br/>  "label": "backend",<br/>  "mode": "System",<br/>  "name": "backendPool",<br/>  "node_count": 1,<br/>  "os_type": "Linux",<br/>  "vm_size": "Standard_DS2_v2"<br/>}</pre> | no |
| <a name="input_frontend_pull_data"></a> [frontend\_pull\_data](#input\_frontend\_pull\_data) | n/a | <pre>object({<br/>      name  = string<br/><br/>      vm_size = string<br/>      os_type = string<br/>      mode = string<br/><br/>      node_count = number<br/><br/>      label = string<br/>      <br/>    })</pre> | <pre>{<br/>  "label": "frontend",<br/>  "mode": "System",<br/>  "name": "frontendPool",<br/>  "node_count": 1,<br/>  "os_type": "Linux",<br/>  "vm_size": "Standard_DS2_v2"<br/>}</pre> | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | The location of the Azure Resource Group. | `string` | `"East US"` | no |
| <a name="input_resource_group_name_prefix"></a> [resource\_group\_name\_prefix](#input\_resource\_group\_name\_prefix) | The prefix to the name of the Azure Resource Group to provision. | `string` | `"rg-aks-lab-epm"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acr_name"></a> [acr\_name](#output\_acr\_name) | The name of the Azure Container Registry (ACR) provisioned. |
| <a name="output_aks_api_server_endpoint"></a> [aks\_api\_server\_endpoint](#output\_aks\_api\_server\_endpoint) | The endpoint of the Kubernetes API server. |
| <a name="output_aks_name"></a> [aks\_name](#output\_aks\_name) | The name of the Azure Kubernetes Service (AKS) resource provisioned. |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | The client key associated with the client certificate. |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | The Certificate Authority (CA) certificate for the Kubernetes API server. |
| <a name="output_cluster_password"></a> [cluster\_password](#output\_cluster\_password) | The password used in Basic authentication to access the Kubernetes API server. |
| <a name="output_cluster_username"></a> [cluster\_username](#output\_cluster\_username) | The username used in Basic authentication to access the Kubernetes API server. |
| <a name="output_kube_config"></a> [kube\_config](#output\_kube\_config) | The raw Kubernetes configuration, kube\_config, used to access the cluster. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | The name of the resource group where resources were created. |
