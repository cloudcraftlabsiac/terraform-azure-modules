# Azure Key Vault Terraform Module

## Features
- Creates Key Vault
- RBAC enabled
- Private Endpoint support
- Private DNS integration

## Usage

```hcl
module "keyvault" {
  source = "git::https://github.com/<your-username>/terraform-azure-modules.git//modules/keyvault"

  key_vault_name      = "kv-demo"
  location            = "Central India"
  resource_group_name = "rg-demo"
  tenant_id           = "xxxxx"
}
