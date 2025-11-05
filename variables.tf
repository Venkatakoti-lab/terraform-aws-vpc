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

## Public_subnets
variable "public_subnet_cidrs" {
  type = list(any)
  validation {
    condition     = length(var.public_subnet_cidrs) == 2
    error_message = "Please provide 2 valid public subnets"
  }
}

variable "public_subnet_cidrs_tags" {
  default = {}
}