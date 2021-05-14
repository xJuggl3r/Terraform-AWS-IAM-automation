terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}


# Lê o arquivo csv e transforma em map para ser consumido
locals {
  csv_data = file("${path.module}/usuarios2.csv")
  users    = csvdecode(local.csv_data)
}

# Cria os usuários
resource "aws_iam_user" "usuarios" {
  for_each = { for usuario in local.users : usuario.usuarios => usuario }
  name     = each.value.usuarios
}

# Atribui senhas aos users
resource "aws_iam_user_login_profile" "add-pass" {
  for_each = aws_iam_user.usuarios
  user     = each.value.name
  pgp_key  = "keybase:${each.value.name}"
}

#Add users em seus respectivos grupos
resource "aws_iam_user_group_membership" "add-group" {
  for_each = { for newGroup in local.users : newGroup.grupo => newGroup }

  user = each.value.usuarios
  groups = [
    each.value.grupo,
  ]

}
