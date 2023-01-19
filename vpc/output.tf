output "vpc_id" {
  value = aws_vpc.cloudx.id
}
output "vpc_cidr" {
  value = aws_vpc.cloudx.cidr_block
}

output "subnet_id" {
  value = {
    a = aws_subnet.public_a.id,
    b = aws_subnet.public_b.id,
    c = aws_subnet.public_c.id
  }
}

output "gateway_id" {
  value = aws_internet_gateway.gw.id
}
