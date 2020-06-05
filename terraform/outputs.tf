output "app_target_group_name" {
  value = aws_lb_target_group.app_lb_tg.name
}

output "app_lc_name" {
  value = aws_launch_template.app_template.name
}

output "app_asg_name" {
  value = aws_autoscaling_group.app_asg.name
}

output "app_instance_sg_id" {
  value = aws_security_group.ec2_sg.id
}

output "app_instance_sg_name" {
  value = aws_security_group.ec2_sg.name
}

output "app_instance_role_name" {
  value = aws_iam_role.ec2_instance_role.name
}

output "app_instance_policy_name" {
  value = aws_iam_policy.ec2_instance_role_policy.name
}

output "app_instance_profile_name" {
  value = aws_iam_instance_profile.ec2_instance_profile.name
}