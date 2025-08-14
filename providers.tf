# Configure the Terraform backend and required providers.
#
# This configuration declares the HashiCorp azurerm provider and pins the version
# to the 4.x series so that Terraform will automatically fetch a recent version.
# The provider configuration uses service principal credentials stored in
# variables to authenticate to Azure.  These credentials are passed via
# variables in `terraform.tfvars` to keep secrets out of version control.
# See the `variables.tf` for definitions of these variables.
terraform {
  required_version = ">= 1.1"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

# Azure Resource Manager provider configuration.  The `features` block is
# required, but can remain empty.  Service principal credentials are supplied
# through variables defined in variables.tf and set in terraform.tfvars.
provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}