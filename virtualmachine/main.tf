resource "azurerm_public_ip" "test_pip" {
  for_each =  var.virtual_machine_name
  name                = each.value.test_pip
  resource_group_name =each.value.resource_group_name
  location            = each.value.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "network_interface_name" {
  for_each            = var.virtual_machine_name
  name                = each.value.network_interface_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.test_pip[each.key].id
  }
}

resource "azurerm_linux_virtual_machine" "vm_name" {
  for_each              = var.virtual_machine_name
  name                  = each.value.vm_name
  resource_group_name   = each.value.resource_group_name
  location              = each.value.location
  size                  = "Standard_F2"
  admin_username        = "adminuser"
  admin_password = "Abcd1234567890"
  network_interface_ids = [azurerm_network_interface.network_interface_name[each.key].id,]
disable_password_authentication =  "false"
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}