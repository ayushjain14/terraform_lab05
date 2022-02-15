output "Linux_avs" {
  value = azurerm_availability_set.avs.name
}

output "VMHostname_linux" {
  value = [azurerm_linux_virtual_machine.linux_vm[*].name]
}
output "PrivateIPAddress_linux" {
  value = [azurerm_linux_virtual_machine.linux_vm[*].private_ip_address]
}
output "PublicIPAddress_linux" {
  value = [azurerm_linux_virtual_machine.linux_vm[*].public_ip_address]
}