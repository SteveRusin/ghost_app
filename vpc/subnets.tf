
resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.cloudx.id
  availability_zone       = "eu-west-1a"
  cidr_block              = cidrsubnet(aws_vpc.cloudx.cidr_block, 8, 1)
  map_public_ip_on_launch = true

  tags = {
    Name = "public_a"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.cloudx.id
  availability_zone       = "eu-west-1b"
  cidr_block              = cidrsubnet(aws_vpc.cloudx.cidr_block, 8, 2)
  map_public_ip_on_launch = true

  tags = {
    Name = "public_b"
  }
}

resource "aws_subnet" "public_c" {
  vpc_id                  = aws_vpc.cloudx.id
  availability_zone       = "eu-west-1c"
  cidr_block              = cidrsubnet(aws_vpc.cloudx.cidr_block, 8, 3)
  map_public_ip_on_launch = true

  tags = {
    Name = "public_b"
  }
}
