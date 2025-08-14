# azurerm_kubernetes_cluster: incluye el default_node_pool
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  resource_group_name = var.resource_group_name
  location            = "eastus"             
  dns_prefix          = "aks-mlops-demo-dns" 

  default_node_pool {
    name       = "agentpool"
    vm_size    = "Standard_A2_v2"
    node_count = 2
  }

  identity {
    type = "SystemAssigned"
}
}