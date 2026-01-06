variable "name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region for the resource group"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Optional tags for the resource group"
}

resource "azurerm_resource_group" "rg" {
  name     = var.name
  location = var.location
  tags     = var.tags
}

output "name" {
  value       = azurerm_resource_group.rg.name
  description = "Resource group name"
}

output "location" {
  value       = azurerm_resource_group.rg.location
  description = "Resource group location"
}
