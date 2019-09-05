//resource "azurerm_network_interface" "net-interface" {
//  location = azurerm_resource_group.adrons_resource_group_workspace.location
//  name = "net-interface"
//  resource_group_name = azurerm_resource_group.adrons_resource_group_workspace.name
//  ip_configuration {
//    name = "config_ip"
//    subnet_id = azurerm_subnet.adrons-vnet-subnet.id
//    private_ip_address_allocation = "Dynamic"
//  }
//}
//
//data "azurerm_image" "dsecustom" {
//  name = var.imagenameDataStaxEnterprise
//  resource_group_name = azurerm_resource_group.adrons_resource_group_workspace.name
//}
//
//resource "azurerm_virtual_machine" "dse-node-1" {
//  name = "dse-node-1"
//  location = azurerm_resource_group.adrons_resource_group_workspace.location
//  network_interface_ids = [azurerm_network_interface.net-interface.id]
//  resource_group_name = azurerm_resource_group.adrons_resource_group_workspace.name
//  vm_size = "Standard_B4ms"
//
//  storage_image_reference {
//    id=data.azurerm_image.dsecustom.id
//  }
//
//  storage_os_disk {
//    name = "dse_node_base"
//    create_option = "FromImage"
//    caching = "None"
//    managed_disk_type = "Standard_LRS"
//  }
//
//  os_profile {
//    admin_username = "dse_admin"
//    computer_name = "hostname"
//    admin_password = ""
//  }
//
//  os_profile_linux_config {
//    disable_password_authentication = false
//  }
//
//  tags = {
//    environment = "cluster"
//  }
//}