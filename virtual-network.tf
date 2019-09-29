resource "azurerm_virtual_network" "adrons-vnet-workspace" {
  name = "adrons-network"
  address_space = [
  "10.0.0.0/16"]
  location            = azurerm_resource_group.adronsworkspace.location
  resource_group_name = azurerm_resource_group.adronsworkspace.name
}

resource "azurerm_subnet" "adrons-vnet-subnet" {
  name                 = "vnet-subnet"
  resource_group_name  = azurerm_resource_group.adronsworkspace.name
  virtual_network_name = azurerm_virtual_network.adrons-vnet-workspace.name
  address_prefix       = "10.0.2.0/24"
}