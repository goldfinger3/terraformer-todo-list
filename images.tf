resource "azurerm_image" "basecassandra" {
  name = "basecassandra"
  location = "West US"
  resource_group_name = azurerm_resource_group.imported_adronsimages.name

  os_disk {
    os_type = "Linux"
    os_state = "Generalized"
    blob_uri = "{blob_uri}"
    size_gb = 30
  }
}

resource "azurerm_image" "basedse" {
  name = "basedse"
  location = "West US"
  resource_group_name = azurerm_resource_group.imported_adronsimages.name

  os_disk {
    os_type = "Linux"
    os_state = "Generalized"
    blob_uri = "{blob_uri}"
    size_gb = 30
  }
}