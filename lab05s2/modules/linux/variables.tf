locals {
  tag_def = {
    Name         = "Terraform-Class"
    Project      = "Learning"
    ContactEmail = "n01476579@humber.ca"
    Environment  = "Lab03"
  }
}
variable "linux_avs" {}
variable "nb_count" {}
variable "linux_name" {}
variable "vm_size" {
  default = "Standard_B1s"
}
variable "admin_user" {
  default = "n01476579"
}
variable "pub_key" {
  default = "/home/n01476579/.ssh/id_rsa.pub"
}
variable "disk_attribute" {
  type = map(string)
  default = {
    storage_account_type = "Premium_LRS"
    disk_size            = "32"
    disk_caching         = "ReadWrite"
  }
}
variable "os_info" {
  type = map(string)
  default = {
    linux_publisher = "Canonical"
    linux_offer     = "UbuntuServer"
    linux_sku       = "19.04"
    linux_version   = "latest"
  }
}
