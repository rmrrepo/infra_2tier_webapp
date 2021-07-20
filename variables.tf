variable "region" {
  description = "region"
  type = string
  default = "us-west-2"
}
variable "vpcname" {
    description = "vpc tag name"
    type    =   string
    default = "vpc-a83862d0"
}

variable "vpc_cidr" {
    description = "vpc cidr"
    type    =   string
    default = "172.31.0.0/16"
  
}

variable "subnet_public_cidr" {
    description = "subnet cidr"
    type    = string
    default = "10.10.1.0/24"
  
}
