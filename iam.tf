data "aws_iam_policy_document" "github_assume_role" {
  for_each = var.github_repos

  statement {
    effect = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.github.arn]
    }
    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }
    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["repo:${each.value.org}/${each.value.repo}:*"]
    }
  }
}

resource "aws_iam_role" "github_actions" {
  for_each = var.github_repos

  name               = each.value.role_name
  assume_role_policy = data.aws_iam_policy_document.github_assume_role[each.key].json
  tags               = var.tags
}

resource "aws_iam_role_policy_attachment" "github_actions" {
  for_each = var.github_repos

  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role       = aws_iam_role.github_actions[each.key].name
}