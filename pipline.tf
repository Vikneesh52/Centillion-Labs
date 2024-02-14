resource "azurerm_data_factory" "terra-demo" {
  name                = "terra-dfac"
  location            = azurerm_resource_group.terra-demo.location
  resource_group_name = azurerm_resource_group.terra-demo.name
}

resource "azurerm_data_factory_pipeline" "terra-demo" {
  name            = "terra-demod"
  data_factory_id = azurerm_data_factory.terra-demo.id
}