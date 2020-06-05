provider "aws" {
  region = "us-west-2"
}

terraform {
  # The latest version of Terragrunt (v0.19.0 and above) requires Terraform 0.12.0 or above.
  required_version = ">= 0.12.0"
}

variable "git_commit" {
  type = string
}

resource "aws_key_pair" "ec2_key_pair" {
  key_name_prefix = "jenkins-learn-key"
  public_key      = file("${path.module}/configs/key.pub")
}

module "app_cluster" {
  source = "../terraform"

  vpc_id        = data.aws_vpc.vpc.id
  vpc_subne_ids = data.aws_subnet_ids.subnets.ids

  service_port = "8080"
  service_docker_compose_content = file("${path.module}/configs/docker-compose.yml")

  # Launch Template
  ec2_ami_id          = data.aws_ami.ec2_ami.id
  ec2_instance_type   = "t2.medium"
  ec2_keypair_name    = aws_key_pair.ec2_key_pair.key_name
  ec2_iam_policy_json = data.aws_iam_policy_document.app_ec2_policy.json

  # Tags
  domain  = "mishah"
  service = "jenkins"
  env     = "learn"
  commit  = var.git_commit


}