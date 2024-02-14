resource "azurerm_storage_account" "to_monitor" {
  name                     = "demovicky"
  resource_group_name      = azurerm_resource_group.terra-demo.name
  location                 = azurerm_resource_group.terra-demo.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_monitor_action_group" "main" {
  name                = "terra-demo-actiongroup"
  resource_group_name = azurerm_resource_group.terra-demo.name
  short_name          = "terrademoact"
}

resource "azurerm_monitor_metric_alert" "terra-demo" {
  name                = "terra-demo-metricalert"
  resource_group_name = azurerm_resource_group.terra-demo.name
  scopes              = [azurerm_storage_account.to_monitor.id]
  description         = "Action will be triggered when Transactions count is greater than 50."

  criteria {
    metric_namespace = "Microsoft.Storage/storageAccounts"
    metric_name      = "Transactions"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 50

    dimension {
      name     = "ApiName"
      operator = "Include"
      values   = ["*"]
    }
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }
}