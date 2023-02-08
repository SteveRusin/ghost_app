resource "aws_subnet" "private_ecs_a" {
  vpc_id                  = aws_vpc.cloudx.id
  availability_zone       = "eu-west-1a"
  cidr_block              = "10.10.10.0/24"
  map_public_ip_on_launch = false

  tags = {
    Name = "private_a"
  }
}

resource "aws_subnet" "private_ecs_b" {
  vpc_id                  = aws_vpc.cloudx.id
  availability_zone       = "eu-west-1b"
  cidr_block              = "10.10.11.0/24"
  map_public_ip_on_launch = false

  tags = {
    Name = "private_b"
  }
}

resource "aws_subnet" "private_ecs_c" {
  vpc_id                  = aws_vpc.cloudx.id
  availability_zone       = "eu-west-1c"
  cidr_block              = "10.10.12.0/24"
  map_public_ip_on_launch = false

  tags = {
    Name = "private_c"
  }
}

resource "aws_route_table_association" "ecs_a" {
  subnet_id = aws_subnet.private_ecs_a.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "ecs_b" {
  subnet_id = aws_subnet.private_ecs_b.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "ecs_c" {
  subnet_id = aws_subnet.private_ecs_c.id
  route_table_id = aws_route_table.private_rt.id
}
