Terraform root module that uses the `aks` module to create an Azure Kubernetes Service (AKS) cluster and Azure Container Registry (ACR). 

## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aks"></a> [aks](#module\_aks) | ../../modules/aks | n/a |

## Resources

No resources.

## Inputs

No inputs.

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
