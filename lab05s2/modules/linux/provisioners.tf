resource "null_resource" "linux_provisioner" {
  count = var.nb_count
  depends_on = [
    azurerm_linux_virtual_machine.linux_vm
  ]
  provisioner "remote-exec" {
    inline = [
      "/usr/bin/hostname"
    ]
    connection {
      type        = "ssh"
      user        = var.admin_user
      private_key = file(var.priv_key)
      #host        = element(azurerm_public_ip.linux_pip[*].fqdn, count.index + 1)
      host = element(azurerm_linux_virtual_machine.linux_vm[*].public_ip_address, count.index + 1)
    }
  }
}