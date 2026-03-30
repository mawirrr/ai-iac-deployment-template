terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "~> 2.0"
    }
  }
}

provider "linode" {
  token = var.linode_token
}

locals {
  vm_requests = csvdecode(file("${path.module}/../input/request.csv"))
}

resource "linode_instance" "vm" {

  for_each = {
    for idx, vm in local.vm_requests :
    "${vm.linode_label}-${idx}" => vm
  }

  label  = each.value.linode_label
  region = each.value.linode_region
  type   = each.value.linode_plan
  image  = each.value.linode_image

  root_pass = each.value.root_password
}
