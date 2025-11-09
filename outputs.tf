output "azs" {
  value = data.aws_availability_zones.zones.names
}
output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "database_subnet_ids" {
  value = aws_subnet.database[*].id
}
output "default_vpc_info" {
  value = data.aws_vpc.default.id
}
output "default_vpc_cidr" {
  value = data.aws_vpc.default.cidr_block
}