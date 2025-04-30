variable resource_group_name_prefix {
  type        = string
  description = "The prefix to the name of the Azure Resource Group to provision."
  default     = "rg-aks-lab-epm"
}

variable resource_group_location {
  type        = string
  description = "The location of the Azure Resource Group."
  default     = "East US"
}


## AKS ##

variable frontend_pull_data {
  type = object({
    name = string

    vm_size = string
    os_type = string
    mode    = string

    node_count = number

    label = string

  })
  default = {
    name = "frontpool"

    vm_size = "Standard_DS2_v2"
    os_type = "Linux"
    mode    = "System"

    node_count = 1

    label = "frontend"
  }

}

variable backend_pull_data {
  type = object({
    name = string

    vm_size = string
    os_type = string
    mode    = string

    node_count = number

    label = string

  })
  default = {
    name = "backpool"

    vm_size = "Standard_DS2_v2"
    os_type = "Linux"
    mode    = "System"

    node_count = 1

    label = "backend"
  }

}

variable aks_node_admin_username {
  type        = string
  description = "The name of the admin account on each K8s node."
  default     = "ansible"

}

variable aks_node_ssh_key_path {
  type        = string
  description = "The path to the public SSH key to put into K8s nodes."
  default     = "./ssh_keys/id_rsa.pub"
}

## ARC ##

variable acr_data {
  type = object({
    name          = string
    sku           = string
    admin_enabled = bool
  })
  default = {
    name          = "acrlabepm"
    sku           = "Basic"
    admin_enabled = true
  }
  description = "description"
}


