resource "azurerm_resource_group" "demo" {
  name     = "Bluepi-resources"
  location = "CentralIndia"
}

##  Demo now
resource "azurerm_storage_account" "StorageAccountDemo" {
  name                     = "bluepi"
  resource_group_name      = azurerm_resource_group.demo.name
  location                 = azurerm_resource_group.demo.location
  account_tier             = "Standard"
  account_replication_type = "GRS"


}
resource "azurerm_monitor_action_group" "ActionGroupDemo" {
  name                = "dev-team-action-group"
  resource_group_name = azurerm_resource_group.demo.name
  short_name          = "exactiongrp"
  email_receiver {
    name          = "email"
    email_address = "rohit.yadav@bluepi.in"
  }
}

resource "azurerm_monitor_metric_alert" "storage_account_alert" {
  name                = "storage-account-capacity-alert"
  resource_group_name = azurerm_resource_group.demo.name
  scopes              = [azurerm_storage_account.StorageAccountDemo.id]

  criteria {
    metric_namespace = "Microsoft.Storage/storageAccounts"
    metric_name      = "UsedCapacity"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 1
  }

  action {
    action_group_id = azurerm_monitor_action_group.ActionGroupDemo.id
  }

  description = "Alert triggered when Used capacity exceeds 1%"
  window_size       = "PT1H"
}
