variable "key_vault_name" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "tenant_id" { type = string }

variable "sku_name" {
  type    = string
  default = "standard"
}

variable "tags" {
  type    = map(string)
  default = {}
}

# Private Endpoint
variable "enable_private_endpoint" {
  type    = bool
  default = false
}

variable "subnet_id" {
  type    = string
  default = null
}

variable "private_dns_zone_id" {
  type    = string
  default = null
}

# RBAC
variable "role_assignments" {
  type = map(object({
    role_definition_name = string
    principal_id         = string
  }))
  default = {}
}
