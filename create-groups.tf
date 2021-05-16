# Cria Grupo CloudAdmin
resource "aws_iam_group" "CloudAdmin" {
  name = "CloudAdmin"
  path = "/users/"
}

# Cria Policies e Grupo DBA
resource "aws_iam_group" "DBA" {
  name = "DBA"
  path = "/users/"
}

# Cria Grupo LinuxAdmin
resource "aws_iam_group" "LinuxAdmin" {
  name = "LinuxAdmin"
  path = "/users/"
}

# Cria Grupo RedesAdmin
resource "aws_iam_group" "RedesAdmin" {
  name = "RedesAdmin"
  path = "/users/"
}

# Cria Grupo Estagiários
resource "aws_iam_group" "Estagiarios" {
  name = "Estagiarios"
  path = "/users/"
}