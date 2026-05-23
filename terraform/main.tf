terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "~> 2.0"
    }

    random = {
      source = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "linode" {
  token = var.linode_token
}

locals {
  vm_requests = csvdecode(file("${path.module}/../input/request.csv"))
}

resource "random_password" "vm_password" {
  for_each = {
    for idx, vm in local.vm_requests :
    "${vm.linode_label}-${idx}" => vm
  }

  length  = 16
  special = true
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

  root_pass = random_password.vm_password[each.key].result
}

output "instance_ip" {
  value = tolist(values(linode_instance.vm)[0].ipv4)[0]
}
output "vm_passwords" {
  value = { for k, p in random_password.vm_password : k => p.result }
  sensitive = true
}
