# ☸️ AKS Infrastructure – Terraform Import & Data Sources

Este repositorio contiene una configuración de **Terraform** para conectarse e importar información de un clúster existente de **Azure Kubernetes Service (AKS)**, permitiendo:

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
```

---

## ⚙️ Requisitos

- [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.5
- [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)
- Una suscripción activa de Azure con permisos para leer AKS.
- **Service Principal** con rol `Contributor` en el recurso o grupo de recursos del AKS.

---

## 🚀 Uso

### 1️⃣ Configurar variables

Renombra **yourterraformvars.tf** to **terraform.tfvars** y editalo con tus valores reales:

```bash
subscription_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
tenant_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
client_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
client_secret = "***********************"
resource_group_name = "xxxx"
aks_cluster_name = "xxxx"
node_pool_name = "xxxx"
```

---

### 2️⃣ Inicializar Terraform

```bash
terraform init
```

---

### 3️⃣ Planificar
```bash
terraform plan
```

---

### 4️⃣ Aplicar

```bash
terraform apply
```

> Esto no deberia modificar nada en Azure; solo debe guardar los outputs en el estado de Terraform.

---

### 5️⃣ Usar el kubeconfig exportado

Puedes exportar el kubeconfig que devuelve Terraform y usarlo con `kubectl`:

terraform output -raw aks_kube_config_raw | base64 --decode > aks-from-tf.kubeconfig
kubectl --kubeconfig aks-from-tf.kubeconfig get nodes

> Esto **no sobrescribe** tu kubeconfig actual.

---

## 📤 Importar recursos a Terraform (opcional)

Si quieres que Terraform **gestione** tu clúster y node pools, debes:

1. Declarar los recursos `azurerm_kubernetes_cluster` y/o `azurerm_kubernetes_cluster_node_pool` en `main.tf`.
2. Importarlos con:

terraform import azurerm_kubernetes_cluster.aks "<AKS_RESOURCE_ID>"
terraform import azurerm_kubernetes_cluster_node_pool.agentpool "<NODEPOOL_RESOURCE_ID>"

> los IDs puedes obtenerlos de los *outputs* o de Azure CLI.

---

## 📚 Referencias

- [Documentación del proveedor `azurerm`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Documentación de AKS](https://learn.microsoft.com/azure/aks/)
- [Autenticación con kubelogin en AKS](https://learn.microsoft.com/azure/aks/kubelogin)