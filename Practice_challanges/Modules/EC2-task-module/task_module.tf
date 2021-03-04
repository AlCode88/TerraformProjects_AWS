module "Task_chellenge_module" {
  source = "./EC2"
  webserver = "Dev-Webserver"
  database = "Dev-database"
  security_groups = "dev-security_gorup"
  EIP = "Webserver-EIP"
}

output "module-databaseID" {
  value = module.Task_chellenge_module.DatabaseIP
}

output "module-webserverID" {
  value = module.Task_chellenge_module.WebserverIP
}

output "EIP" {
  value = module.Task_chellenge_module.EIP
 }