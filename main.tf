terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }
}

locals {
  accountTier = "Standard"
  tags = {
    account = "StorageDev"
  }

  replication_type = {
    dev  = "LRS"
    qa   = "LRS"
    prod = "GRS"
  }
}
resource "azurerm_storage_account" "securestorage" {
  name                     = var.StorageAccountName
  location                 = var.rglocation
  resource_group_name      = var.rgname
  account_tier             = local.accountTier
  account_replication_type = local.replication_type[var.env]
  tags                     = local.tags
}