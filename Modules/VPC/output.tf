output "vpc_id" {
  value = aws_vpc.week4_VPC.id
}

output "VPC_cidr_block" {
  value = aws_vpc.week4_VPC.cidr_block
}

output "pub_sub_a" {
  value = aws_subnet.public_a.id
}

output "pub_sub_b" {
  value = aws_subnet.public_b.id
}
