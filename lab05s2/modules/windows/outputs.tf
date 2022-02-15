output "Windows_avs" {
  value = azurerm_availability_set.avs.name
}

output "VMHostname_windows" {
  value = values(azurerm_windows_virtual_machine.windows_vm)[*].name
}
output "PrivateIPAddress_windows" {
  value = values(azurerm_windows_virtual_machine.windows_vm)[*].private_ip_address
}
output "PublicIPAddress_windows" {
  value = values(azurerm_windows_virtual_machine.windows_vm)[*].public_ip_address
}