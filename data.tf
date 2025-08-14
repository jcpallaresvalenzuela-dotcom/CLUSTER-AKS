# Data sources used to query information about existing Azure resources.
#
# This file defines data blocks that tell Terraform how to look up your
# existing AKS cluster and, optionally, a specific node pool within that
# cluster.  When you run `terraform plan` or `terraform apply`, Terraform
# will call the Azure API to retrieve these details.

# Retrieve details about an existing Azure Kubernetes Service (AKS) cluster.
# The arguments `name` and `resource_group_name` must match the cluster you
# wish to import.  See the documentation for `azurerm_kubernetes_cluster` data
# source for more information.
data "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  resource_group_name = var.resource_group_name
}

# Optionally retrieve information about a node pool if a name is provided.
# This block will only be evaluated when `var.node_pool_name` is not an empty
# string.  To query a node pool, set the `node_pool_name` variable in your
# terraform.tfvars file.
data "azurerm_kubernetes_cluster_node_pool" "nodepool" {
  count                     = length(var.node_pool_name) > 0 ? 1 : 0
  name                      = var.node_pool_name
  kubernetes_cluster_name   = var.aks_cluster_name
  resource_group_name       = var.resource_group_name
}