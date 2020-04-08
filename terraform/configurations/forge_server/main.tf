module "minecraft-forge-server" {
  source = "../../modules/vm_instance"
  
  name       = "minecraft-forge-server"
  server_jar = "forge-1.15.2-31.1.0"
}
