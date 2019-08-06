provider "azurerm" {
  version = "=1.27.0"

  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id

}

resource "azurerm_resource_group" "adrons_resource_group_images" {
  name     = "adrons_images"
  location = "West US 2"

  tags = {
    environment = "Development"
  }
}