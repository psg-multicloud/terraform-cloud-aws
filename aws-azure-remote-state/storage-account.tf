resource "azurerm_resource_group" "rg_01" {
  name     = "remote-state-rg"
  location = var.location

  tags = local.common_tags
}

resource "azurerm_storage_account" "sto_acc_01" {
  name                     = "patriciagoisremotestate"
  resource_group_name      = azurerm_resource_group.rg_01.name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  blob_properties {
    versioning_enabled = true
  }
  tags = local.common_tags
}

resource "azurerm_storage_container" "container_1_terraform" {
  name                 = "remote-state"
  storage_account_name = azurerm_storage_account.sto_acc_01.name
}