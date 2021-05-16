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
  region  = "us-west-1"
}

# Cria Policies e Grupo CloudAdmin

resource "aws_iam_group" "CloudAdmin" {
  name = "CloudAdmin"
  path = "/users/"
}

resource "aws_iam_group_policy_attachment" "aws_config_fulladmin" {
  group      = aws_iam_group.CloudAdmin.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# Cria Policies e Grupo DBA

resource "aws_iam_group" "DBA" {
  name = "DBA"
  path = "/users/"
}

resource "aws_iam_group_policy_attachment" "aws_config_DBA" {
  group      = aws_iam_group.DBA.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
}

# Cria Policies e Grupo LinuxAdmin

resource "aws_iam_group" "LinuxAdmin" {
  name = "LinuxAdmin"
  path = "/users/"
}

resource "aws_iam_group_policy_attachment" "aws_config_LixAdmin" {
  group      = aws_iam_group.LinuxAdmin.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}


# Cria Policies e Grupo RedesAdmin
resource "aws_iam_group" "RedesAdmin" {
  name = "RedesAdmin"
  path = "/users/"
}

resource "aws_iam_group_policy_attachment" "aws_config_RedesAdmin" {
  group      = aws_iam_group.RedesAdmin.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
}


# Cria Policies e Grupo Estagiários
resource "aws_iam_group" "Estagiarios" {
  name = "Estagiarios"
  path = "/users/"
}

resource "aws_iam_group_policy_attachment" "aws_config_Estagiarios" {
  group      = aws_iam_group.Estagiarios.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}


# Enforce MFA

module "aws-enforce-mfa" {
  source = "jeromegamez/enforce-mfa/aws"
  groups = [aws_iam_group.CloudAdmin.name, aws_iam_group.DBA.name, aws_iam_group.LinuxAdmin.name, aws_iam_group.RedesAdmin.name, aws_iam_group.Estagiarios.name]
  #users  = [aws_iam_user.mfa_user.name]
}

# Cria users e senhas from .csv, add to groups
resource "null_resource" "Add-users-pass" {
 provisioner "local-exec" {
    command = "/bin/bash chmod +x ./cria-users.sh || ./cria-users.sh"
  }
}