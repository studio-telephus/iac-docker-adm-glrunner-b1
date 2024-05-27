module "bw_gitlab_runner_registration_key" {
  source = "github.com/studio-telephus/terraform-bitwarden-get-item-login.git?ref=1.0.0"
  id     = "7590a09f-4731-45b7-a8a6-b10a00eee6b2"
}

module "bw_platform_gitlab_api_key" {
  source = "github.com/studio-telephus/terraform-bitwarden-get-item-login.git?ref=1.0.0"
  id     = "9fc47ae5-4539-418e-9c57-b11e0163403f"
}

