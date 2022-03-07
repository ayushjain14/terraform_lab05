resource "null_resource" "linux_provisioner" {
  count = var.nb_count
  depends_on = [
    azurerm_linux_virtual_machine.vmlinux
  ]

  provisioner "remote-exec" {
    inline = [
      "cat /etc/os-release"
    ]
    connection {
      type        = "ssh"
      user        = var.linux_admin_user
      private_key = file(var.priv_key)
      host        = element(azurerm_public_ip.linux_pip[*].fqdn, count.index + 1)
      #host       = element(azurerm_linux_virtual_machine.vmlinux[*].public_ip_address, count.index + 1)
    }
  }
}
