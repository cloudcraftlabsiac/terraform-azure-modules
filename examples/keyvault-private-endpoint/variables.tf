variable "key_vault_name" {}
variable "location" {}
variable "resource_group_name" {}
variable "tenant_id" {}

variable "subnet_id" {}
variable "private_dns_zone_id" {}

variable "tags" {
  default = {}
}

variable "role_assignments" {
  type = map(object({
    role_definition_name = string
    principal_id         = string
  }))
}
