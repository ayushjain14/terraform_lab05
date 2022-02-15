resource "azurerm_availability_set" "avs" {
  name                         = var.linux_avs
  location                     = var.location
  resource_group_name          = var.rg2
  platform_update_domain_count = 5
  platform_fault_domain_count  = 2
  depends_on                   = [azurerm_resource_group.rg2]
}
resource "azurerm_network_interface" "nic" {
  count               = var.nb_count
  name                = "${var.linux_name}-nic${format("%1d", count.index + 1)}"
  location            = var.location
  resource_group_name = var.rg2
  depends_on          = [azurerm_subnet_network_security_group_association.subnet_association]
  tags                = local.tag_def
  ip_configuration {
    name                          = "${var.linux_name}-ipconfig${format("%1d", count.index + 1)}"
    subnet_id                     = azurerm_subnet.subnet.id
    public_ip_address_id          = element(azurerm_public_ip.linux_pip[*].id, count.index + 1)
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_public_ip" "linux_pip" {
  count               = var.nb_count
  name                = "${var.linux_name}-pip${format("%1d", count.index + 1)}"
  resource_group_name = var.rg2
  location            = var.location
  allocation_method   = "Dynamic"
  depends_on          = [azurerm_resource_group.rg2]
  tags                = local.tag_def
}
resource "azurerm_linux_virtual_machine" "linux_vm" {
  count                 = var.nb_count
  name                  = "${var.linux_name}-vm${format("%1d", count.index + 1)}"
  resource_group_name   = var.rg2
  location              = var.location
  size                  = var.vm_size
  admin_username        = var.admin_user
  computer_name         = "${var.linux_name}-vm${format("%1d", count.index + 1)}"
  network_interface_ids = [element(azurerm_network_interface.nic[*].id, count.index + 1)]
  tags                  = local.tag_def
  admin_ssh_key {
    username   = var.admin_user
    public_key = file(var.pub_key)
  }
  os_disk {
    caching              = var.disk_attribute["disk_caching"]
    storage_account_type = var.disk_attribute["storage_account_type"]
    name                 = "${var.linux_name}-osdisk${format("%1d", count.index + 1)}"
    disk_size_gb         = var.disk_attribute["disk_size"]
  }
  source_image_reference {
    publisher = var.os_info["linux_publisher"]
    offer     = var.os_info["linux_offer"]
    sku       = var.os_info["linux_sku"]
    version   = var.os_info["linux_version"]
  }
}