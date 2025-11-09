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

##private_subnets
variable "private_subnet_cidrs" {
  type = list(any)
  validation {
    condition = length(var.private_subnet_cidrs) == 2 
    error_message = "please provide 2 valid private subnets"
  }
}
variable "private_subnet_cidrs_tags" {
  default = {}
}

##database
variable "database_subnet_cidrs" {
  type = list(any)
  validation {
    condition = length(var.database_subnet_cidrs) == 2
    error_message = "Please provide 2 valid database subnets"
  }
}
variable "database_subnet_cidrs_tags" {
  default = {}
}
##nat_gateway
variable "nat_gateway_tags" {
  default = {}
}