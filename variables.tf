variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "github_repos" {
  description = "Map of GitHub repositories to create OIDC roles for"
  type = map(object({
    org        = string
    repo       = string
    policy_arn = string
  }))
}

variable "role_prefix" {
  description = "Prefix for IAM role names"
  type        = string
  default     = "github-actions"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}