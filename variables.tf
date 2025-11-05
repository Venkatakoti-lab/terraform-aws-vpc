variable "project" {

}
variable "environment" {

}
variable "vpc_cidr" {

}
variable "enable_dns_hostnames" {
  type    = bool
  default = true
}
variable "common_tags" {
  default = {

  }
}
variable "vpc_tags" {
  default = {}
}
#IGW tags

variable "igw_tags" {
  default = {}
}