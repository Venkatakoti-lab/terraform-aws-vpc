# output "azs_info" {
#   value = slice(data.aws_availability_zones.available.names, 0,2)
# }
output "vpc_info" {
  value = aws_vpc.main.id
}
# output "default_vpc_id" {
#   value = data.aws_vpc.default_vpc
# }
