# azurerm_kubernetes_cluster: incluye el default_node_pool
resource "azurerm_kubernetes_cluster" "aks" {
  name                                = var.aks_cluster_name
  resource_group_name                 = var.resource_group_name
  location                            = "eastus"             
  dns_prefix                          = "aks-mlops-demo-dns" 
  image_cleaner_enabled               = true
  image_cleaner_interval_hours        = 168
  node_os_upgrade_channel             = "None"
  oidc_issuer_enabled                 = true
  workload_identity_enabled           = true

  default_node_pool {
    name                          = "agentpool"
    vm_size                       = "Standard_A2_v2"
    node_count                    = 2
    auto_scaling_enabled          = true
    max_count                     = 5
    min_count                     = 2

    upgrade_settings {
      drain_timeout_in_minutes      = 0
      max_surge                     = "10%"
      node_soak_duration_in_minutes = 0
    }
  }

  identity {
    type = "SystemAssigned"
}
}