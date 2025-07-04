variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "account_id" {
  description = "AWS account ID"
  type        = string
}

variable "github_repos" {
  description = "Map of GitHub repositories to create OIDC roles for"
  type = map(object({
    org       = string
    repo      = string
    role_name = string
  }))
}


variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}