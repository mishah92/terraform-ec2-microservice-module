data "aws_caller_identity" "current" {}

data "aws_ami" "ec2_ami" {
  most_recent = true
  owners      = ["099720109477"]
  name_regex  = "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server*"

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

data "aws_iam_policy_document" "app_ec2_policy" {
  statement {
    sid = "1"

    actions = [
      "s3:*"
    ]

    resources = [
      "*",
    ]
  }
}