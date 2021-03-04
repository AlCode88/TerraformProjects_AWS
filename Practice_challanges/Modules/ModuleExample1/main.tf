module "AnyCustomName" {
  source = "./EC2"
  Ec2name = "ModuleInstanceName"
}
output "module_output" {
  value = module.AnyCustomName.instance_id
}