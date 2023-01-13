resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.cloudx.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }


  tags = {
    Name = "public_rt"
  }
}

resource "aws_main_route_table_association" "public_rt" {
  vpc_id         = aws_vpc.cloudx.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "b" {
  gateway_id     = aws_internet_gateway.gw.id
  route_table_id = aws_route_table.public_rt.id
}
