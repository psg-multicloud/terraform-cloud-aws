output "subnet_id" {
  value = aws_subnet.subnet-01.id
}
output "security_group_id" {
    value = aws_security_group.security-group-01-terraform.id
  
}