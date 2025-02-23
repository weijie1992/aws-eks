# Create VPC
resource "aws_vpc" "eks_vpc" {
  cidr_block           = "11.0.0.0/16"
  enable_dns_support   = true //require for some addon 
  enable_dns_hostnames = true //require for some addon 
  tags = {
    Name = "${local.env}-main"
  }
}
