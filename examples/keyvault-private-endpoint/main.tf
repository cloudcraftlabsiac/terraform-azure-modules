module "keyvault" {
  source = "../../modules/keyvault"

  key_vault_name      = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = var.tenant_id

  enable_private_endpoint = true
  subnet_id               = var.subnet_id
  private_dns_zone_id     = var.private_dns_zone_id

  role_assignments = var.role_assignments

  tags = var.tags
}
