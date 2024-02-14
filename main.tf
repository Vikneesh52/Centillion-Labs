terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = "29ce79cf-9e6f-474b-89a1-3ac8b2b5f245"
  features {}
}

resource "azurerm_resource_group" "terra-demo" {
  name     = "terra-demo-rg"
  location = "east us"
}