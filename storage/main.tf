resource "azurerm_storage_account" "storage_account_name" {
  name                     = var.storage_account_name
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "example" {
  name                  = var.container_name
  storage_account_name  = var.storage_account_name
  container_access_type = "private"
  depends_on = [ azurerm_storage_account.storage_account_name ]
}
