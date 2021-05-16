# Attach policy to groups
resource "aws_iam_group_policy_attachment" "aws_config_fulladmin" {
  group      = aws_iam_group.CloudAdmin.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_group_policy_attachment" "aws_config_DBA" {
  group      = aws_iam_group.DBA.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
}

resource "aws_iam_group_policy_attachment" "aws_config_LixAdmin" {
  group      = aws_iam_group.LinuxAdmin.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_group_policy_attachment" "aws_config_RedesAdmin" {
  group      = aws_iam_group.RedesAdmin.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
}

resource "aws_iam_group_policy_attachment" "aws_config_Estagiarios" {
  group      = aws_iam_group.Estagiarios.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}