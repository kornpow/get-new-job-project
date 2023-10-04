# Cluster SG
resource "aws_security_group" "cluster_internal" {
  name        = "cluster_internal traffic"
  description = "Allow cluster_internal traffic"
  vpc_id      = var.vpc_id
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
}

resource "aws_security_group_rule" "dev_home_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["${var.dev_home_ip}/32"]
  security_group_id = aws_security_group.dev_access.id
}


# Traefik Ingress
resource "aws_security_group" "traefik_ingress" {
  name        = "traefik_ingress"
  description = "Allow traefik_ingress traffic"
  vpc_id      = var.vpc_id
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
