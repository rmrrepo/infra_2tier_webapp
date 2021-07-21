output "instanceid" {
  description = "instance id"
  value       = aws_instance.linuxbox.id
}

output "ec2_securitygroup" {
  description = "instance security group"
  value       = aws_security_group.ec2_sg
}


output "elb_securitygroup" {
  description = "elb security group "
  value       = aws_security_group.elb_sg
}

output "aws_elb" {
  description = "elb security group "
  value       = aws_elb.elb_2tierapp.dns_name
}