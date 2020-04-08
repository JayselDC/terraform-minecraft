variable "region" {
  default = "europe-west2"
}

variable "zone" {
  default = "europe-west2-c"
}

data "terraform_remote_state" "forge_server" {
  backend = "gcs"
  
  config  = {
    bucket      = "minecraft-tf-state"
    credentials = "../jaysel-minecraft.json"
  }
}