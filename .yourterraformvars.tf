# rename to -> terraform.tfvars
#
# Provide values for variables declared in variables.tf.  Replace the placeholder
# strings below with your own Azure subscription, service principal and AKS
# details.  Leaving a value blank (e.g. "") will cause Terraform to prompt for
# it at runtime.

# Azure subscription and authentication parameters
subscription_id  = ""  # replace with your subscription ID
tenant_id        = ""  # replace with your tenant ID
client_id        = ""  # replace with your service principal application (client) ID
client_secret    = ""  # replace with your service principal secret

# Target AKS cluster
resource_group_name = ""   # name of the resource group containing the AKS cluster
aks_cluster_name    = ""   # name of the existing AKS cluster

# Optional: node pool name
node_pool_name     = ""  # uncomment and set if you want to import a specific node pool