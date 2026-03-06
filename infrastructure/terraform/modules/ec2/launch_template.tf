resource "aws_launch_template" "this" {
  name_prefix   = "${var.name}-lt"
  image_id      = var.ami_id
  instance_type = var.instance_type

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_profile.name
  }

  vpc_security_group_ids = [var.ec2_sg_id]

  user_data = base64encode(templatefile("${path.module}/user_data.sh", {
    db_host     = var.db_host
    db_user     = var.db_user
    db_password = var.db_password
    db_name     = var.db_name
  }))

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${var.name}-ec2"
    }
  }
}