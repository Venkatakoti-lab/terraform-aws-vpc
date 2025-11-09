resource "aws_vpc_peering_connection" "default" {
    count = var.is_peering_required ? 1 : 0
  peer_vpc_id   = data.aws_vpc.default.id #accepter
  vpc_id        = aws_vpc.this.id #requestor
   auto_accept   = true
   tags = merge(
    var.common_tags,
    var.peering_tags,
    {
        Name="${local.resource_name}-default"
    }

   )
}
# public_peering_route
resource "aws_route" "public_peering" {
    count= var.is_peering_required ? 1 : 0
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.default[count.index].id
}
#private_peering_route
resource "aws_route" "private_peering" {
    count= var.is_peering_required ? 1 : 0
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.default[count.index].id
}
#database_peering_route
resource "aws_route" "database_peering" {
    count= var.is_peering_required ? 1 : 0
  route_table_id            = aws_route_table.database.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.default[count.index].id
}
#default_peering_route
resource "aws_route" "default_peering" {
    count= var.is_peering_required ? 1 : 0
  route_table_id            = data.aws_vpc.default.main_route_table_id
  destination_cidr_block    = var.vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.default[count.index].id
}