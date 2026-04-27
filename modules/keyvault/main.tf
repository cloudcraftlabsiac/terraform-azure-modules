resource "azurerm_key_vault" "kv" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = var.tenant_id
  sku_name                    = var.sku_name

  enable_rbac_authorization   = true
  purge_protection_enabled    = true
  soft_delete_retention_days  = 7

  public_network_access_enabled = false

  tags = var.tags
}

# Private Endpoint
resource "azurerm_private_endpoint" "kv_pe" {
  count               = var.enable_private_endpoint ? 1 : 0
  name                = "${var.key_vault_name}-pe"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "${var.key_vault_name}-psc"
    private_connection_resource_id = azurerm_key_vault.kv.id
    subresource_names              = ["vault"]
    is_manual_connection           = false
  }
}

# Private DNS Zone Group
resource "azurerm_private_dns_zone_group" "kv_dns" {
  count               = var.enable_private_endpoint && var.private_dns_zone_id != null ? 1 : 0
  name                = "kv-dns-group"
  private_endpoint_id = azurerm_private_endpoint.kv_pe[0].id

  private_dns_zone_ids = [var.private_dns_zone_id]
}

# RBAC
resource "azurerm_role_assignment" "kv_roles" {
  for_each = var.role_assignments

  scope                = azurerm_key_vault.kv.id
  role_definition_name = each.value.role_definition_name
  principal_id         = each.value.principal_id
}
