resource "random_shuffle" "random_subnet" {
  input        = data.aws_subnets.selected.ids
  result_count = 1
}
