# Outputs for the imported AKS cluster.
#
# These outputs expose useful information about the existing AKS cluster.  Some
# outputs are marked as sensitive because they contain credentials.  Use these
# outputs to feed values into other modules or for debugging purposes.

output "aks_cluster_id" {
  description = "The resource ID of the imported AKS cluster."
  value       = data.azurerm_kubernetes_cluster.aks.id
}

output "aks_fqdn" {
  description = "The fully qualified domain name (FQDN) of the AKS API server."
  value       = data.azurerm_kubernetes_cluster.aks.fqdn
}

output "aks_location" {
  description = "The Azure region where the AKS cluster resides."
  value       = data.azurerm_kubernetes_cluster.aks.location
}

output "aks_kubernetes_version" {
  description = "The version of Kubernetes running on the AKS cluster."
  value       = data.azurerm_kubernetes_cluster.aks.kubernetes_version
}

# Raw kubeconfig encoded in Base64.  This output is sensitive because it
# includes authentication credentials for accessing the cluster via kubectl.
# According to the Azure/AKS module documentation, kube_config_raw contains
# the full Kubernetes config used by kubectl【931897640416613†screenshot】.
output "aks_kube_config_raw" {
  description = "Base64 encoded kubeconfig for the cluster (sensitive)."
  value       = data.azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}

# Output information about the node pool if one was requested.
output "node_pool_id" {
  description = "The ID of the imported AKS node pool (only set if node_pool_name is provided)."
  value       = try(data.azurerm_kubernetes_cluster_node_pool.nodepool[0].id, null)
  depends_on  = [data.azurerm_kubernetes_cluster_node_pool.nodepool]
}