terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "~> 2.0"
    }
  }
}

provider "linode" {
  token = var.linode_token
}

resource "linode_instance" "vm" {
  label  = var.vm_name
  region = var.region
  type   = var.plan
  image  = "linode/ubuntu22.04"

  root_pass = var.root_password
}
