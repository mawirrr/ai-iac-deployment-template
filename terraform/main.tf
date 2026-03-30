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
    for vm in local.vm_requests :
    vm.name => vm
  }

  label  = each.value.vm_name
  region = each.value.region
  type   = each.value.plan
  image  = each.value.image

  root_pass = each.value.root_password
}
