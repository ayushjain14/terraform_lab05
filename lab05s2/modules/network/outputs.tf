output "VirtualNetworkName" {
  value = azurerm_virtual_network.vnet.name
}
output "VirtualNetworkAddressSpace" {
  value = azurerm_virtual_network.vnet.address_space
}
output "SubnetName1" {
  value = azurerm_subnet.subnet.name
}
output "SubnetName2" {
  value = azurerm_subnet.subnet2.name
}
output "SubnetAddressSpace1" {
  value = azurerm_subnet.subnet.address_prefixes
}
output "SubnetAddressSpace2" {
  value = azurerm_subnet.subnet2.address_prefixes
}