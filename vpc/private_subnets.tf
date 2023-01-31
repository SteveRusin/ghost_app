resource "aws_subnet" "private_db_a" {
  vpc_id                  = aws_vpc.cloudx.id
  availability_zone       = "eu-west-1a"
  cidr_block              = "10.10.20.0/24"
  map_public_ip_on_launch = false

  tags = {
    Name = "private_db_a"
  }
}

resource "aws_subnet" "private_db_b" {
  vpc_id                  = aws_vpc.cloudx.id
  availability_zone       = "eu-west-1b"
  cidr_block              = "10.10.21.0/24"
  map_public_ip_on_launch = false

  tags = {
    Name = "private_db_b"
  }
}
resource "aws_subnet" "private_db_c" {
  vpc_id                  = aws_vpc.cloudx.id
  availability_zone       = "eu-west-1c"
  cidr_block              = "10.10.22.0/24"
  map_public_ip_on_launch = false

  tags = {
    Name = "private_db_c"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.cloudx.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }



  tags = {
    Name = "private_rt"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id = aws_subnet.private_db_a.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "b" {
  subnet_id = aws_subnet.private_db_b.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "c" {
  subnet_id = aws_subnet.private_db_c.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_db_subnet_group" "ghost" {
  name        = "ghost"
  subnet_ids  = [aws_subnet.private_db_a.id, aws_subnet.private_db_b.id, aws_subnet.private_db_c.id]
  description = "ghost database subnet group"
}
