locals {
  tag_def = {
    Name         = "Terraform-Class"
    Project      = "Learning"
    ContactEmail = "n01476579@humber.ca"
    Environment  = "Lab03"
  }
}
variable "windows_avs" {
  #  default = "windows-aset"
}
variable "windows_name" {
  type = map(string)
}
variable "vm_size" {
  default = "Standard_B1s"
}
variable "admin_user" {
  default = "n01476579"
}
variable "admin_password" {
  default = "Humber@6579"
}
variable "pub_key" {
  default = "/home/n01476579/.ssh/id_rsa.pub"
}
variable "disk_attribute1" {
  type = map(string)
  default = {
    storage_account_type = "StandardSSD_LRS"
    disk_size            = "127"
    disk_caching         = "ReadWrite"
  }
}
variable "os_info1" {
  type = map(string)
  default = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}
