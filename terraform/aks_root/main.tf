module "aks" {
  source                  = "../../modules/aks"
  aks_node_ssh_key_path   = "./ssh_keys/id_rsa.pub"
  aks_node_admin_username = "ansible"
}
