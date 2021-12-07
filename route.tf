resource "aws_route_table" "public" {
  vpc_id = aws_vpc.terra-test.id

  tags = {
    Name = "terra_public_rt_pjc"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.terra-test.id

  tags = {
    Name = "terra_private_rt_pjc"
  }
}

