# Input variable definitions for the AKS import example.
#
# These variables allow you to parameterise the configuration so that it can
# connect to your own Azure subscription, tenant and AKS cluster.  Do not put
# secrets or sensitive values directly into your Terraform configuration – set
# them in your `terraform.tfvars` file instead.

variable "subscription_id" {
  description = "The Azure subscription ID under which the AKS cluster is deployed."
  type        = string
}

variable "tenant_id" {
  description = "The Azure Active Directory tenant ID used for authentication."
  type        = string
}

variable "client_id" {
  description = "The client (application) ID of the service principal used to authenticate to Azure."
  type        = string
  sensitive   = true
}

variable "client_secret" {
  description = "The client secret associated with the service principal."
  type        = string
  sensitive   = true
}

variable "resource_group_name" {
  description = "The name of the resource group containing the existing AKS cluster."
  type        = string
}

variable "aks_cluster_name" {
  description = "The name of the Azure Kubernetes Service (AKS) cluster to import."
  type        = string
}

# Optional: the name of a specific node pool within the AKS cluster.  If set,
# a data source will retrieve information about that node pool as well.
variable "node_pool_name" {
  description = "The name of a node pool within the AKS cluster (optional)."
  type        = string
  default     = ""
}