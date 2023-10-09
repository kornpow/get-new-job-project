data "aws_subnets" "selected" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}


data "template_file" "user_data" {
  template = file("${path.module}/user_data.sh.tpl")

  vars = {
    server_public_ip = aws_eip.server.public_ip
    server_private_ip = aws_eip.server.private_ip
  }
}