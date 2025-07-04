# Terraform AWS GitHub OIDC Template

This template creates AWS IAM roles and an OIDC provider for GitHub Actions to authenticate with AWS without using long-lived credentials.

## Features

- Creates GitHub OIDC provider in AWS
- Creates IAM roles with trust policies for specific GitHub repositories
- Follows security best practices with repository-specific access
- Uses native Terraform for IAM policy documents

## Usage

1. Clone or use this template
2. Update `common.auto.tfvars` with your specific values
3. Run terraform commands

### Configuration

Edit `common.auto.tfvars` to configure:

```hcl
region = "us-east-1"

github_repos = {
  "my-app" = {
    org        = "your-github-org"
    repo       = "your-repo-name"
    policy_arn = "arn:aws:iam::YOUR-ACCOUNT:policy/YourPolicy"
  }
}

role_prefix = "github-actions"

tags = {
  Environment = "dev"
  Project     = "your-project"
}
```

### Deployment

```bash
terraform init
terraform plan
terraform apply
```

## GitHub Actions Workflow

Use the created roles in your GitHub Actions:

```yaml
name: Deploy
on:
  push:
    branches: [main]

permissions:
  id-token: write
  contents: read

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v4
        with:
          role-to-assume: ${{ secrets.AWS_ROLE_ARN }}
          aws-region: us-east-1
      - name: Deploy
        run: |
          # Your deployment commands here
```

## Outputs

- `oidc_provider_arn`: ARN of the GitHub OIDC provider
- `role_arns`: Map of role names to ARNs
- `role_names`: Map of role names

## Security

- Roles are restricted to specific GitHub repositories
- Uses OIDC for secure, temporary credentials
- No long-lived AWS credentials required