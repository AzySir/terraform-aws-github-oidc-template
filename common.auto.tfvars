# AWS Configuration
region = "eu-west-2"
account_id = "123456789012"

# GitHub OIDC Configuration
github_repos = {
  "my-app" = {
    org       = "my-org"
    repo      = "my-app"
    role_name = "github-actions-my-app"
  }
  "my-infrastructure" = {
    org       = "my-org"
    repo      = "my-infrastructure"
    role_name = "github-actions-my-infrastructure"
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