# Cluster SG
resource "aws_security_group" "cluster_internal" {
  name        = "cluster_internal traffic"
  description = "Allow cluster_internal traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "cluster-internal"
  }
}

resource "aws_security_group_rule" "traefik_dashboard" {
  type              = "ingress"
  from_port         = 9000
  to_port           = 9000
  protocol          = "tcp"
  cidr_blocks       = [data.aws_vpc.selected.cidr_block]
  security_group_id = aws_security_group.cluster_internal.id
}

# Dev SG
resource "aws_security_group" "dev_access" {
  name        = "dev_access traffic"
  description = "Allow dev_access traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "dev-access"
  }
}

resource "aws_security_group_rule" "dev_home_ssh" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  cidr_blocks       = ["${var.dev_home_ip}/32"]
  security_group_id = aws_security_group.dev_access.id
}


# Traefik Ingress
resource "aws_security_group" "traefik_ingress" {
  name        = "traefik_ingress"
  description = "Allow traefik_ingress traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "internet-to-traefik"
  }
}

resource "aws_security_group_rule" "allow_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.traefik_ingress.id
}

resource "aws_security_group_rule" "allow_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.traefik_ingress.id
}


resource "aws_security_group" "internet_access" {
  name        = "internet_access"
  description = "Allow egress internet_access traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "internet-access"
  }
}

resource "aws_security_group_rule" "internet_access_everywhere" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.internet_access.id
}

resource "aws_iam_role" "cluster_instance_role" {
  name = "cluster_instance_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ec2_ssm_full_access" {
  role       = aws_iam_role.cluster_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}

resource "aws_iam_instance_profile" "cluster_instance_profile" {
  name = "cluster_instance_profile"
  role = aws_iam_role.cluster_instance_role.name
}