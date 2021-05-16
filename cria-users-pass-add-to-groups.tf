# Cria users e senhas from .csv, add to groups
resource "null_resource" "Add-users-pass" {
 provisioner "local-exec" {
    command = "/bin/bash chmod +x ./cria-users.sh || ./aws-iam-cria-usuario.sh usuarios2.csv"
  }
}