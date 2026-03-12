variable "linode_token" {
  description = "Linode API token"
}

variable "vm_name" {
  description = "VM name"
}

variable "region" {
  description = "Deployment region"
}

variable "plan" {
  description = "Linode instance type"
}

variable "root_password" {
  sensitive = true
}
