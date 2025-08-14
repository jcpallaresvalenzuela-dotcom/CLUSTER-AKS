# ☸️ AKS Infrastructure – Terraform Import & Data Sources

Este repositorio contiene la configuración de **Terraform** para conectarse e importar información de un clúster existente de **Azure Kubernetes Service (AKS)**, permitiendo:

- Consultar datos del clúster y *node pools* vía **data sources**.
- Exportar el **kubeconfig** (`kube_config_raw`) para conexión con `kubectl`.
- Integrar el clúster con otros recursos gestionados por Terraform.

---

## 📂 Estructura del proyecto

```bash
.
├── data.tf                 # Data sources de AKS y node pools
├── main.tf                 # Configuración principal (sin recursos de creación)
├── outputs.tf              # Outputs útiles (ID, FQDN, versión, kubeconfig)
├── providers.tf            # Configuración del proveedor azurerm
├── variables.tf            # Declaración de variables
├── yourterraformvars.tf    # Valores reales para variables (secreto, no subir a VCS)
└── README.md

---

## ⚙️ Requisitos

- [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.5
- [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)
- Una suscripción activa de Azure con permisos para leer AKS.
- **Service Principal** con rol `Contributor` en el recurso o grupo de recursos del AKS.

---

## 🚀 Uso

### 1️⃣ Configurar variables

Edita `terraform.tfvars` y rellena con tus valores reales:

