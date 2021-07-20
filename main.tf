provider "aws" {
    profile = "default"
    region = var.region  
}
/*
resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr

    tags = {
      Name = var.vpcname
    }
}

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.subnet_public_cidr
    availability_zone = "us-west-2a"
    tags = {
        Name = "public_subnet"
    } 
}

resource "aws_internet_gateway" "gw" {
  vpc_id = var.vpcname

  tags = {
    Name = "Default-VPC-IGW"
  }
}
*/
resource "aws_instance" "linuxbox" {
    ami = "ami-0dc8f589abe99f538"
    instance_type = "t2.micro"
    subnet_id = "subnet-3210c178"
    vpc_security_group_ids = ["sg-78886141"]
    user_data = "${file("install_apache.sh")}"

   tags = {
    Name = "2tier_instance"
  }   
}

# Create a new load balancer
resource "aws_elb" "elb_2tierapp" {
  name               = "2tierapp-terraform-elb"
  availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]
  security_groups = ["sg-78886141"]

/*
  access_logs {
    bucket        = "rmr_2tierapp"
    bucket_prefix = "2tierapp"
    interval      = 60
  }
*/

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "http:80/index.php"
    interval            = 30
  }

  instances                   = [aws_instance.linuxbox.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "2tierapp-terraform-elb"
  }
}