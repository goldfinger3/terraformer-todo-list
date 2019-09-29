resource "azurerm_kubernetes_cluster" "test" {
  name                = "acctestaks1"
  location            = "${azurerm_resource_group.adronsworkspace.location}"
  resource_group_name = "${azurerm_resource_group.adronsworkspace.name}"
  dns_prefix          = "acctestagent1"

  agent_pool_profile {
    name            = "default"
    count           = 1
    vm_size         = "Standard_D1_v2"
    os_type         = "Linux"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.clientid
    client_secret = var.clientsecret
  }

  tags = {
    Environment = "Production"
  }
}
