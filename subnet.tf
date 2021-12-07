resource "aws_subnet" "public01" {
  vpc_id            = aws_vpc.terra-test.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "terra-public-01-subnet"
  }
}

resource "aws_subnet" "private01" {
  vpc_id            = aws_vpc.terra-test.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-1c"
  tags = {
    Name = "terra-private-01-subnet"
  }
}

#인터넷 게이트웨어 생성
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.terra-test.id

  tags = {
    Name = "terra-IGW"
  }
}

# NAT 게이트웨이 생성
resource "aws_eip" "terraEIP" { #EIP 부여 (이유로서 NAT 게이트웨어는 EIP 필요하니까)
  vpc = true

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.terraEIP.id

  subnet_id = aws_subnet.private01.id

  tags = {
    Name = "terra_NAT"
  }
}
