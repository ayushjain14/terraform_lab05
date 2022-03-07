variable "windows_name" {
  type = map(string)
}
variable "windows_avset" {}
variable "location" {}
variable "resource_group" {}
variable "subnet2_id" {}
variable "rg_windows" {}

variable "windows_admin_user" {
  default = "winadm"
}

variable "admin_password" {
  default = "Winadm!23"
}

variable "wos_disk_attr" {
  type = map(string)

  default = {
    wos_storage_account_type = "StandardSSD_LRS"
    wos_disk_size            = "127"
    wos_disk_caching         = "ReadWrite"
  }
}

variable "windows_publisher" {
  default = "MicrosoftWindowsServer"
}

variable "windows_offer" {
  default = "WindowsServer"
}

variable "windows_sku" {
  default = "2019-Datacenter"
}

variable "windows_version" {
  default = "latest"
}
