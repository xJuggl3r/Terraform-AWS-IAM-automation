# Enforce MFA

module "aws-enforce-mfa" {
  source = "jeromegamez/enforce-mfa/aws"
  groups = [aws_iam_group.CloudAdmin.name, aws_iam_group.DBA.name, aws_iam_group.LinuxAdmin.name, aws_iam_group.RedesAdmin.name, aws_iam_group.Estagiarios.name]
  #users  = [aws_iam_user.mfa_user.name]
}