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
  count                   = length(var.public_subnet_cidrs)
  availability_zone       = local.azs_names[count.index]
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnet_cidrs[count.index]

  tags = merge(
    var.common_tags,
    var.public_subnet_cidrs_tags,
    {
      Name = "${local.resource_name}-public-${local.azs_names[count.index]}"
    }
  )
}

##Private_subnets
resource "aws_subnet" "private" {
  count                   = length(var.public_subnet_cidrs)
  availability_zone       = local.azs_names[count.index]
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.private_subnet_cidrs[count.index]

  tags = merge(
    var.common_tags,
    var.private_subnet_cidrs_tags,
    {
      Name = "${local.resource_name}-private-${local.azs_names[count.index]}"
    }
  )
}

##database_subnets
resource "aws_subnet" "database" {
  count = length(var.database_subnet_cidrs)
  vpc_id     = aws_vpc.this.id
  availability_zone = local.azs_names[count.index]
  cidr_block = var.database_subnet_cidrs[count.index]

  tags = merge(
    var.common_tags,
    var.database_subnet_cidrs_tags,
    {
      Name= "${local.resource_name}-database${local.azs_names[count.index]}"
    }
  )
}
##elastic_ip
resource "aws_eip" "nat" {
  domain   = "vpc"
}

##NAT_gateway

resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.nat.id 
  subnet_id     = aws_subnet.public[0].id

  tags = merge(
    var.common_tags,
    var.nat_gateway_tags,
    {
      Name= "${local.resource_name}"
    }
  )

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}