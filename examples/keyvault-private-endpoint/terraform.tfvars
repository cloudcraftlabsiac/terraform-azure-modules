key_vault_name      = "kv-demo-001"
location            = "Central India"
resource_group_name = "rg-demo"
tenant_id           = "xxxxx"

subnet_id           = "/subscriptions/xxx/.../subnets/default"
private_dns_zone_id = "/subscriptions/xxx/.../privatelink.vaultcore.azure.net"

tags = {
  env = "demo"
}

role_assignments = {
  admin = {
    role_definition_name = "Key Vault Administrator"
    principal_id         = "xxxxx"
  }
}
