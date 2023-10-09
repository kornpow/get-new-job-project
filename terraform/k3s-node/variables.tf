variable "vpc_id" {
  type = string
}

variable "ami_server" {
  type = string
}

variable "ami_agent" {
  type    = string
  default = "deleteme"
}

variable "ssh_key_name" {
  type = string
}