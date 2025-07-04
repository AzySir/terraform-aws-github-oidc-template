# AWS Configuration
region = "<add region here>"
account_id = "<add account id here>"

# GitHub OIDC Configuration
github_repos = {
  "<add repo name here>" = {
    org       = "<add org here>"
    repo      = "<add repo here>"
    role_name = "<add new role name here>"
  }
}

# Tags
tags = {
  ManagedBy  = "terraform"
  CreatedBy  = "Adam Sir"
  Repository = "<insert repo name here>"
}