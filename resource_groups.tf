resource "azurerm_resource_group" "adronsworkspace" {
  name     = "adronsimages"
  location = var.locationlong

  tags = {
    environment = "Development Images"
  }
}
