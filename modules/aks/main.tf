## Required Providers ##

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

## Names, Prefixes, and Resource Groups ## 

resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}

resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = random_pet.rg_name.id
}

resource "random_pet" "aks_cluster_name" {
  prefix = "aks-cluster"
}

resource "random_pet" "aks_cluster_dns_prefix" {
  prefix = "aks-dns"
}

## AKS ##

resource "azurerm_kubernetes_cluster" "aks" {
  name       = random_pet.aks_cluster_name.id
  dns_prefix = random_pet.aks_cluster_dns_prefix.id

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  linux_profile {
    admin_username = var.aks_node_admin_username

    ssh_key {
      key_data = file(var.aks_node_ssh_key_path)
    }
  }

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name       = var.frontend_pull_data.name
    node_count = var.frontend_pull_data.node_count
    vm_size    = var.frontend_pull_data.vm_size
    node_labels = {
      "role" = var.frontend_pull_data.label
    }
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "backend" {
  name       = var.backend_pull_data.name
  node_count = var.backend_pull_data.node_count
  vm_size    = var.backend_pull_data.vm_size
  mode       = var.backend_pull_data.mode

  node_labels = {
    "role" = var.backend_pull_data.label
  }

  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
}

## ACR ##

resource "azurerm_container_registry" "acr" {
  name          = var.acr_data.name
  sku           = var.acr_data.sku
  admin_enabled = var.acr_data.admin_enabled

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}