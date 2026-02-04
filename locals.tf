locals {
  common_tags={
    Project= var.project_name
    Environment= var.environment
    Terraform= true
  }
  az_names= slice(data.aws_availability_zones.available.names, 0,2)
  default_vpc_id= data.aws_vpc.default.id
}
