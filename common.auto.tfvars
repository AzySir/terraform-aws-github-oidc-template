# AWS Configuration
region = "us-east-1"

# GitHub OIDC Configuration
github_repos = {
  "my-app" = {
    org        = "my-org"
    repo       = "my-app"
    policy_arn = "arn:aws:iam::123456789012:policy/MyAppDeploymentPolicy"
  }
  "my-infrastructure" = {
    org        = "my-org"
    repo       = "my-infrastructure"
    policy_arn = "arn:aws:iam::123456789012:policy/MyInfrastructurePolicy"
  }
}

# IAM Configuration
role_prefix = "github-actions"

# Tags
tags = {
  Environment = "dev"
  Project     = "my-project"
  Owner       = "my-team"
}