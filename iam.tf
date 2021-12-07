#https://docs.aws.amazon.com/ko_kr/IAM/latest/UserGuide/access_policies_job-functions.html
#해당링크에 근거하여 iac code 작성하였음. <> 고객 니즈에 맞춰 추가 권한 설정 필요

resource "aws_iam_group" "admin_group" { // admin 그룹 생성 
  name = "admin_group"
  path = "/users/"
}

resource "aws_iam_group" "Billing_group" { // 경리 그룹 생성 
  name = "billing_group"
  path = "/users/"
}

resource "aws_iam_group" "dba_group" { // DBA 그룹 생성 
  name = "dba_group"
  path = "/users/"
}

resource "aws_iam_group" "ds_group" { // 데이터 사이언티스 그룹 생성 
  name = "ds_group"
  path = "/users/"
}

resource "aws_iam_group" "dev_group" { // 개발 그룹 생성
  name = "dev_group"
  path = "/users/"
}

resource "aws_iam_group" "ops_group" { // 운영(네트워크, 시스템 포함) 그룹 생성 
  name = "ops_group"
  path = "/users/"
}

resource "aws_iam_group" "read_group" { // read 권한 그룹 생성 
  name = "read_group"
  path = "/users/"
}

resource "aws_iam_group" "security_group" { // 보안 그룹 생성 
  name = "security_group"
  path = "/users/"
}

resource "aws_iam_group" "support_group" { // 지원 그룹 생성 
  name = "suppot_group"
  path = "/users/"
}

resource "aws_iam_group" "view_group" { // view 권한 그룹 생성 
  name = "dev_group"
  path = "/users/"
}

resource "aws_iam_group_policy_attachment" "policy_attach" {      // 그룹<> iam 연결
  group       = aws_iam_group.dev_group.name
  policy_arn  = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}


variable "users" {                                          //user 생성
  description = "Create IAM Users"
  type        = list
  default     = ["Steve", "Tony", "banner", "Thor" ]
}


resource "aws_iam_user" "dev_user" {
  count   = length(var.users)
  name    = element(var.users, count.index) 
  path    = "/dev/"
tags = {
  Name = "front_developers"
  }
}




resource "aws_iam_user_group_membership" "grp_mem" {
  count   = length(var.users)
  user    = element(var.users, count.index)
  groups = [
    aws_iam_group.dev_group.name 
  
  ]
}