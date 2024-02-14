resource "azurerm_container_registry" "acr" {
  name                = "vickyregistry"
  resource_group_name = azurerm_resource_group.terra-demo.name
  location            = azurerm_resource_group.terra-demo.location
  sku                 = "Standard"
  admin_enabled       = false
}

resource "azurerm_container_registry_webhook" "webhook" {
  name                = "vickywebhook"
  resource_group_name = azurerm_resource_group.terra-demo.name
  registry_name       = azurerm_container_registry.acr.name
  location            = azurerm_resource_group.terra-demo.location

  service_uri = "https://vickywebhook.terra-demo/mytag"
  status      = "enabled"
  scope       = "mytag:*"
  actions     = ["push"]
  custom_headers = {
    "Content-Type" = "application/json"
  }
}