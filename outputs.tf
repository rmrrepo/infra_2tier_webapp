output "instanceid" {
  description = "instance id"
  value       = aws_instance.linuxbox.id
}
/*
output "instance_securitygroup" {
  description = "instance security group"
  value       = aws_instance.vpc_security_group_ids
}


output "elb_securitygroup" {
  description = "elb security group "
  value       = aws_instance.vpc_security_group_ids
}
*/
