resource "azurerm_availability_set" "avs" {
  name                         = var.windows_avs
  location                     = var.location
  resource_group_name          = var.rg2
  platform_update_domain_count = 5
  platform_fault_domain_count  = 2
  depends_on                   = [azurerm_resource_group.rg2]
}
resource "azurerm_network_interface" "nic" {
  for_each            = var.windows_name
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.rg2
  depends_on          = [azurerm_subnet_network_security_group_association.subnet_association]
  tags                = local.tag_def
  ip_configuration {
    name                          = "${each.key}-ipconfig"
    subnet_id                     = azurerm_subnet.subnet2.id
    public_ip_address_id          = azurerm_public_ip.linux_pip[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_public_ip" "linux_pip" {
  for_each            = var.windows_name
  name                = "${each.key}-pip"
  resource_group_name = var.rg2
  location            = var.location
  allocation_method   = "Dynamic"
  depends_on          = [azurerm_resource_group.rg2]
  tags                = local.tag_def
}
resource "azurerm_windows_virtual_machine" "windows_vm" {
  for_each              = var.windows_name
  name                  = each.key
  resource_group_name   = var.rg2
  location              = var.location
  size                  = var.vm_size
  admin_username        = var.admin_user
  admin_password        = var.admin_password
  computer_name         = each.key
  network_interface_ids = [azurerm_network_interface.nic[each.key].id]
  tags                  = local.tag_def

  winrm_listener {
    protocol = "Http"
  }
  os_disk {
    caching              = var.disk_attribute1["disk_caching"]
    storage_account_type = var.disk_attribute1["storage_account_type"]
    name                 = "${each.key}-osdisk"
    disk_size_gb         = var.disk_attribute1["disk_size"]
  }
  source_image_reference {
    publisher = var.os_info1["publisher"]
    offer     = var.os_info1["offer"]
    sku       = var.os_info1["sku"]
    version   = var.os_info1["version"]
  }
}