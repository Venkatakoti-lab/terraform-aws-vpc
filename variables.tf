variable "cidr_block" {
  default = "10.0.0.0/16"
}
variable "common_tags" {
  default = {}
}
variable "project_name" {
  
}
variable "environment" {
  
}
variable "vpc_tags" {
  type = map(string)
  default = {}
}
variable "igw_tags" {
  default = {}
}
variable "public_subnet_cidrs" {
  default = []
}
variable "public_subnet_tags" {
  default = {}
}
variable "private_subnet_cidrs" {
  default = []
}
variable "private_subnet_tags" {
  default = {}
}
variable "database_subnet_cidrs" {
  default = []
}
variable "database_subnet_tags" {
  default = {}
}
variable "eip_tags" {
  default = {}
}
variable "nat_gateway_tags" {
  default = {}
}
variable "public_route_tags" {
  default = {}
}
variable "private_route_tags" {
  default = {}
}
variable "database_route_tags" {
  default = {}
}
variable "is_peering_required" {
  default = false
}
variable "vpc_peering_tags" {
  default = {}
}
