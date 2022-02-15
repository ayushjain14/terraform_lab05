output "resource_group_name" {
  value = module.resource_group.resource_group.name
}
output "VirtualNetworkName1" {
  value = module.network.VirtualNetworkName
}
output "VirtualNetworkAddressSpace1" {
  value = module.network.VirtualNetworkAddressSpace
}
output "SubnetName1main" {
  value = module.network.SubnetName1
}
output "SubnetName2main" {
  value = module.network.SubnetName2
}
output "SubnetAddressSpace1main" {
  value = module.network.SubnetAddressSpace1
}
output "SubnetAddressSpace2main" {
  value = module.network.SubnetAddressSpace2
}
output "Linux_avs_name" {
  value = module.linux.Linux_avs.name
}
output "VMHostname_linux1" {
  value = module.linux.VMHostname_linux.name
}
output "PrivateIPAddress_linux1" {
  value = module.linux.PrivateIPAddress_linux
}
output "PublicIPAddress_linux1" {
  value = module.linux.PublicIPAddress_linux
}
output "Windows_avs_name" {
  value = module.windows.Windows_avs.name
}
output "VMHostname_windows1" {
  value = module.windows.VMHostname_windows.name
}
output "PrivateIPAddress_windows1" {
  value = module.windows.PrivateIPAddress_windows
}
output "PublicIPAddress_windows1" {
  value = module.windows.PublicIPAddress_windows
}

