output "oidc_provider_arn" {
  description = "ARN of the GitHub OIDC provider"
  value       = aws_iam_openid_connect_provider.github.arn
}

output "role_arns" {
  description = "Map of role names to ARNs"
  value = {
    for key, role in aws_iam_role.github_actions : key => role.arn
  }
}

output "role_names" {
  description = "Map of role names"
  value = {
    for key, role in aws_iam_role.github_actions : key => role.name
  }
}