
# Create Subnet
resource "aws_subnet" "private_zone1" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "11.0.0.0/19"
  availability_zone = local.zone1

  tags = {
    Name                                                   = "${local.env}-private-${local.zone1}"
    Environment                                            = "development"
    ManagedBy                                              = "Terraform"
    "kubernetes.io/cluster/${local.env}-${local.eks_name}" = "owned" # This makes EKS recognize the subnet, good if we have multiple eks cluster
    "kubernetes.io/role/internal-elb"                      = "1"     # for EKS to create private/internal load balancers
  }
}

resource "aws_subnet" "private_zone2" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "11.0.32.0/19"
  availability_zone = local.zone2

  tags = {
    Name                                                   = "${local.env}-private-${local.zone2}"
    Environment                                            = "development"
    ManagedBy                                              = "Terraform"
    "kubernetes.io/cluster/${local.env}-${local.eks_name}" = "owned" # This makes EKS recognize the subnet, good if we have multiple eks cluster
    "kubernetes.io/role/internal-elb"                      = "1"     # for EKS to create private/internal load balancers
  }
}

resource "aws_subnet" "public_zone1" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "11.0.64.0/19"
  map_public_ip_on_launch = true #some service or vm need public ip address, thus enable
  availability_zone       = local.zone1
  tags = {
    Name                                                   = "${local.env}-public-${local.zone1}"
    "kubernetes.io/role/elb"                               = "1"     #EKS use to discover subnet to create public load balancer
    "kubernetes.io/cluster/${local.env}-${local.eks_name}" = "owned" # This makes EKS recognize the subnet, good if we have multiple eks cluster
  }
}

resource "aws_subnet" "public_zone2" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "11.0.96.0/19"
  map_public_ip_on_launch = true #some service or vm need public ip address, thus enable
  availability_zone       = local.zone2
  tags = {
    Name                                                   = "${local.env}-public-${local.zone2}"
    "kubernetes.io/role/elb"                               = "1"     #EKS use to discover subnet to create public load balancer
    "kubernetes.io/cluster/${local.env}-${local.eks_name}" = "owned" # This makes EKS recognize the subnet, good if we have multiple eks cluster
  }
}
