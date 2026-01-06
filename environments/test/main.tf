variable "environment" {
  type        = string
  description = "Environment name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "subnets" {
  type        = list(object({ name = string, cidr = string }))
  description = "Subnets for the network"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Optional tags for resources"
}

# Resource Group
module "rg" {
  source   = "../../modules/resource-group"
  name     = "rg-${var.environment}"
  location = var.location
  tags     = merge(var.tags, { environment = var.environment })
}

# Network
module "network" {
  source        = "../../modules/network"
  vnet_name     = "vnet-${var.environment}"
  address_space = ["10.0.0.0/16"]
  rg_name       = module.rg.name
  subnets       = var.subnets
  location      = var.location
  tags          = merge(var.tags, { environment = var.environment })
}

# Storage
module "storage" {
  source               = "../../modules/storage"
  storage_account_name = "st${var.environment}001"
  rg_name              = module.rg.name
  location             = var.location
  tags                 = merge(var.tags, { environment = var.environment })
}
