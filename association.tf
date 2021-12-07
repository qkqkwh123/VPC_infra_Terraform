#Association 이게  라우팅 테이블에서 서브넷 연결 
resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.public01.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_association" {
  subnet_id      = aws_subnet.private01.id
  route_table_id = aws_route_table.private.id
}
