terraform {

  backend "s3" {

    bucket = "terraform-state"
    key    = "linode/terraform.tfstate"
    region = "us-east-1"

    endpoint = "https://sg-sin-1.linodeobjects.com"

    force_path_style = true

    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true

  }

}
