resource "aws_instance" "cluster_server_2" {
  ami           = var.ami_server
  instance_type = "t4g.small"

  network_interface {
    network_interface_id = aws_network_interface.server_2.id
    device_index         = 0
  }

  root_block_device {
    volume_type = "gp3"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  key_name = var.ssh_key_name
  user_data = trimspace(templatefile("${path.module}/user_data.sh.tpl", {
    server_public_ip  = aws_eip.server_2.public_ip
    server_private_ip = aws_eip.server_2.private_ip
  }))
  user_data_replace_on_change = true
  iam_instance_profile        = "cluster_instance_profile"

  tags = {
    Name = "cluster-server-2"
  }
}

resource "aws_network_interface" "server_2" {
  subnet_id = random_shuffle.random_subnet.result[0]
  security_groups = [
    "sg-0046a51e5745b40ec",
    "sg-025f453a68409864c",
    "sg-006a9892ca0aaa430",
    "sg-010da49623a7d11a9"
  ]
}

# # elastic ip
resource "aws_eip" "server_2" {
  network_interface = aws_network_interface.server_2.id
}