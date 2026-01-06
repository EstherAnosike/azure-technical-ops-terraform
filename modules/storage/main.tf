variable "storage_account_name" {
  type        = string
  description = "Storage account name (must be globally unique)"
}

variable "rg_name" {
  type        = string
  description = "Resource group for the storage account"
}

variable "location" {
  type        = string
  description = "Azure region for the storage account"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Optional tags"
}

resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}

output "storage_account_name" {
  value       = azurerm_storage_account.sa.name
  description = "Storage account name"
}

output "storage_account_primary_web_endpoint" {
  value       = azurerm_storage_account.sa.primary_web_endpoint
  description = "Primary web endpoint of the storage account"
}
