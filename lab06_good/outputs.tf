output "rg_linux" {
  value = module.resource_group.rg_linux.name
}

output "rg_windows" {
  value = module.resource_group.rg_windows.name
}
output "rg_network" {
  value = module.resource_group.rg_network.name
}

output "vnet_space" {
  value = module.network.vnet_space
}
output "vnet_name" {
  value = module.network.vnet_name
}
output "subnet1_space" {
  value = module.network.subnet1_space
}
output "subnet1_name" {
  value = module.network.subnet1_name
}
output "subnet2_space" {
  value = module.network.subnet2_space
}
output "subnet2_name" {
  value = module.network.subnet2_name
}

output "Linux_hostnames" {
  value = [module.linux.Linux_hostnames]
}

output "Linux_private_ip_addresses" {
  value = [module.linux.Linux_private_ip_addresses]
}

output "Linux_public_ip_addresses" {
  value = [module.linux.Linux_public_ip_addresses]
}

output "Linux_domain_names" {
  value = [module.linux.Linux_domain_names]
}

output "Windows_hostnames" {
  value = [module.windows.Windows_hostnames]
}

output "Windows_private_ip_addresses" {
  value = [module.windows.Windows_private_ip_addresses]
}

output "Windows_public_ip_addresses" {
  value = [module.windows.Windows_public_ip_addresses]
}

output "Windows_domain_names" {
  value = [module.windows.Windows_domain_names]
}
