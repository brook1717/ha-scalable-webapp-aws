resource "aws_autoscaling_group" "this" {
  name = "${var.name}-asg"

  desired_capacity = 2
  max_size = 6
  min_size = 2

  vpc_zone_identifier = var.private_subnet_ids

  health_check_type = "ELB"
  health_check_grace_period = 60

  launch_template {
    id = aws_launch_template.this.id
    version = "$Latest"
  }

  target_group_arns = [var.target_group_arn]

  tag {
    key = "Name"
    value = "${var.name}-asg-instance"
    propagate_at_launch = true
  }
}