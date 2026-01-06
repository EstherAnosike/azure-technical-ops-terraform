variable "vnet_name" {
  type        = string
  description = "Name of the virtual network"
}

variable "address_space" {
  type        = list(string)
  default     = ["10.0.0.0/16"]
  description = "VNet address space"
}

variable "rg_name" {
  type        = string
  description = "Resource group name for the VNet"
}

variable "subnets" {
  type        = list(object({ name = string, cidr = string }))
  description = "List of subnets with names and CIDR blocks"
}

variable "location" {
  type        = string
  description = "Azure region for the network"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Optional tags"
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.rg_name
  tags                = var.tags
}

resource "azurerm_subnet" "subnets" {
  for_each             = { for s in var.subnets : s.name => s }
  name                 = each.value.name
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [each.value.cidr]
}

output "vnet_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "VNet ID"
}

output "subnet_ids" {
  value       = [for s in azurerm_subnet.subnets : s.id]
  description = "Subnet IDs"
}
