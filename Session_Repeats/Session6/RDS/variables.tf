variable "env" {
  type = string
  default = "dev"
}
# DB snapshot variable 
variable "skip_snapshot" {
  type = bool 
  value = true
}