resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = merge(
    var.common_tags,
    var.vpc_tags,
    {
      Name = local.resource_name
    }
  )
}

#IGW

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.this.id

  tags = merge(
    var.common_tags,
    var.igw_tags,
    {
      Name = local.resource_name
    }
  )
}
##Public_subnets
resource "aws_subnet" "public" {
  count      = length(var.public_subnet_cidrs)
  availability_zone = local.azs_names[count.index]
  map_public_ip_on_launch= true 
  vpc_id     = aws_vpc.this.id
  cidr_block = var.public_subnet_cidrs[count.index]

  tags = merge(
    var.common_tags,
    var.public_subnet_cidrs_tags,
    {
      Name = "${local.resource_name}-${local.azs_names[count.index]}"
    }
  )
}