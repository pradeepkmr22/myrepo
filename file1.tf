Skip to content
 Enterprise
Search or jump to…
Pull requests
Issues
Explore
 
@sredd03 
platform-org
/
nc-tfe-nc-dev-risk-riskframework-dev
Public
generated from platform-org/terraform-root-module-template
Code
Pull requests
3
Security
Insights
nc-tfe-nc-dev-risk-riskframework-dev/terraform/providers.platform.tf
@srvc-ghorg-tfe-nc
srvc-ghorg-tfe-nc Update terraform/providers.platform.tf
Latest commit b4b810c on Oct 3
 History
 4 contributors
@srvc-ghorg-tfe-nc@sgakkoju@sstri01@shussain
 99 lines (70 sloc)  2.17 KB


# This file is managed by Terraform. Any user modifications to it will get overwritten and may cause terraform state issues.
# Custom variables and providers may be configured in a separate file such as custom_providers.tf

provider "vault" {
  address    = var.VAULT_ADDRESS
  namespace  = var.VAULT_NAMESPACE
  token_name = var.TFC_RUN_ID

  auth_login {
    namespace = var.VAULT_NAMESPACE
    path      = "auth/approle/login"

    parameters = {
      role_id   = var.VAULT_APPROLE_ROLE_ID
      secret_id = var.VAULT_APPROLE_SECRET_ID
    }
  }
}

data "vault_generic_secret" "self" {
  path = "auth/token/lookup-self"
}

data "vault_aws_access_credentials" "creds" {
  backend = "aws/risk"
  role    = "multi_pillar_perm_support"
}

provider "aws" {
  region     = "us-east-2"
  access_key = data.vault_aws_access_credentials.creds.access_key
  secret_key = data.vault_aws_access_credentials.creds.secret_key

  default_tags {

  }
}









provider "dns" {
  update {
    server = "10.236.8.56"
  }
}

data "vault_generic_secret" "rancher_token" {
  path = "platform/kv/rancher"
}

provider "rancher2" {
  api_url   = "https://rancher-dev.nc.theocc.com"
  token_key = data.vault_generic_secret.rancher_token.data.token
}

provider "rancher2" {
  alias     = "rancher_dev_nc"
  api_url   = "https://rancher-dev.nc.theocc.com"
  token_key = data.vault_generic_secret.rancher_token.data.token
}

data "vault_generic_secret" "rancher_dev3_token" {
  path = "platform/kv/rancher-dev3"
}

provider "rancher2" {
  alias     = "rancher_dev3_nc"
  api_url   = "https://rancher-dev3.nc.theocc.com"
  token_key = data.vault_generic_secret.rancher_dev3_token.data.token
}

data "vault_generic_secret" "rancher_dev4_token" {
  path = "platform/kv/rancher-dev3-k8s-dev4"
}

provider "rancher2" {
  alias     = "rancher_dev4_nc"
  api_url   = "https://rancher-dev3.nc.theocc.com"
  token_key = data.vault_generic_secret.rancher_dev4_token.data.token
}

data "vault_generic_secret" "rancher_dev5_token" {
  path = "platform/kv/rancher-dev5"
}

provider "rancher2" {
  alias     = "rancher_dev5_nc"
  api_url   = "https://rancher-dev5.nc.theocc.com"
  token_key = data.vault_generic_secret.rancher_dev5_token.data.token
}



Options Clearing Corporation
Options Clearing Corporation
Options Clearing Corporation
© 2022 GitHub, Inc.
Help
Support
API
Training
Blog
About
GitHub Enterprise Server 3.6.0
