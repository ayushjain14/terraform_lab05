module "resource_group" {
  source   = "./modules/resource_group"
  rg2      = "rgLab05"
  location = "canadaeast"
}
module "network" {
  source              = "./modules/network"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  vnet                = "vnet-prd"
  vnet-space          = ["10.0.0.0/16"]
  subnet1             = "subnet1-prd"
  subnet2             = "subnet2-prd"
  subnet-space1       = ["10.0.1.0/24"]
  subnet-space2       = ["10.0.2.0/24"]
  nsg1                = "nsg1-prd"
  nsg2                = "nsg2-prd"
}
module "linux" {
  source              = "./modules/linux"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  linux_name          = "terraform-u-vm"
  nb_count            = 2
  linux_avs           = "linux_avset"
  subnet_id           = module.network.subnet_id
}
module "windows" {
  source              = "./modules/windows"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  windows_avs         = "windows_avset"
  windows_name = {
    lab-web-w-vm1 = "Standard_B1s"
  }
  subnet_id = module.network.subnet_id
} 