terraform {

  backend "s3" {

    bucket = "terraform-state"
    key    = "linode/terraform.tfstate"
    region = "us-east-1"

    endpoints = {
      s3 = "https://sg-sin-1.linodeobjects.com"
    }

    skip_requesting_account_id  = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true

    force_path_style = true

  }

}
