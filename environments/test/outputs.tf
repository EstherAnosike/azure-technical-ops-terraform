output "rg_name" {
  value       = module.rg.name
  description = "Resource group name"
}

output "rg_location" {
  value       = module.rg.location
  description = "Resource group location"
}

output "vnet_id" {
  value       = module.network.vnet_id
  description = "Virtual network ID"
}

output "subnet_ids" {
  value       = module.network.subnet_ids
  description = "Subnet IDs"
}

output "storage_account_name" {
  value       = module.storage.storage_account_name
  description = "Storage account name"
}

output "storage_account_web_endpoint" {
  value       = module.storage.storage_account_primary_web_endpoint
  description = "Storage account web endpoint"
}
