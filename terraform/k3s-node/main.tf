resource "random_shuffle" "random_subnet" {
  input        = data.aws_subnets.selected.ids
  result_count = 1
}


resource "aws_instance" "cluster_server" {
  ami           = var.ami_server
  instance_type = "t4g.small"

  network_interface {
    network_interface_id = aws_network_interface.server.id
    device_index         = 0
  }

  root_block_device {
    volume_type = "gp3"
  }

  key_name  = var.ssh_key_name
  user_data = trimspace(data.template_file.user_data.rendered)
  user_data_replace_on_change = true
  iam_instance_profile = "cluster_instance_profile"

  tags = {
    Name = "cluster-server"
  }
}

resource "aws_network_interface" "server" {
  subnet_id       = random_shuffle.random_subnet.result[0]
  security_groups = ["sg-0046a51e5745b40ec", "sg-025f453a68409864c", "sg-006a9892ca0aaa430", "sg-010da49623a7d11a9"]
}

# # elastic ip
resource "aws_eip" "server" {
  network_interface = aws_network_interface.server.id
}

# resource "aws_instance" "cluster_agent_1" {
#   ami           = var.ami_agent
#   instance_type = "t4g.small"

#   network_interface {
#     network_interface_id = aws_network_interface.device.id
#     device_index         = 0
#   }

#   key_name  = var.ssh_key_name
#   user_data = data.local_file.user_data.content

#   tags = {
#     Name = "cluster-agent-1"
#   }
# }

# resource "aws_network_interface" "server" {
#   subnet_id       = random_shuffle.random_subnet.result[0]
#   security_groups = ["sg-0046a51e5745b40ec", "sg-025f453a68409864c"]
# }

# # # elastic ip
# resource "aws_eip" "server" {
#   network_interface = aws_network_interface.server.id
# }

