module "container_adm_glrunner_b1" {
  source    = "github.com/studio-telephus/terraform-lxd-instance.git?ref=1.0.1"
  name      = "container-adm-glrunner-b1"
  image     = "images:debian/bookworm"
  profiles  = ["limits", "fs-dir", "nw-adm"]
  autostart = true
  nic = {
    name = "eth0"
    properties = {
      nictype        = "bridged"
      parent         = "adm-network"
      "ipv4.address" = "10.0.10.135"
    }
  }
  mount_dirs = [
    "${path.cwd}/filesystem-shared-ca-certificates",
    "${path.cwd}/filesystem",
  ]
  exec_enabled = true
  exec         = "/mnt/install.sh"
  environment = {
    RANDOM_STRING                  = "efbe6178-2934-4588-ac71-6435cabc02dd"
    GITLAB_RUNNER_REGISTRATION_KEY = var.gitlab_runner_registration_key
    GIT_SA_USERNAME                = var.git_sa_username
    GIT_SA_TOKEN                   = var.git_sa_token
  }
}
