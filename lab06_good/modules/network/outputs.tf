output "vnet_space" {
  value = azurerm_virtual_network.vnet.address_space
}
output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}
output "subnet1_space" {
  value = azurerm_subnet.subnet1.address_prefixes
}
output "subnet1_name" {
  value = azurerm_subnet.subnet1.name
}
output "subnet2_space" {
  value = azurerm_subnet.subnet2.address_prefixes
}
output "subnet2_name" {
  value = azurerm_subnet.subnet2.name
}

output "subnet1_id" {
  value = azurerm_subnet.subnet1.id
}

output "subnet2_id" {
  value = azurerm_subnet.subnet2.id
}

