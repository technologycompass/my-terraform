terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
 
   cloud {
      organization = "TechnologyCompass"
      workspaces {
        name = "my_terraform_dev"
      }
    }
}

provider "aws" {
  region     = "us-east-1"
}


resource "aws_instance" "myec2" {
  ami           = "ami-0aa7db6294d00216f" # Example AMI ID, replace with a valid one for your region
  instance_type = var.instance_type

  tags = {
    Name = "MyFirstEC2Instance"
  }

}

resource "aws_security_group" "sg-01" {
  name = "app-firewall"
  tags = local.default_tags
}

resource "aws_security_group" "sg-02" {
  name = "db-firewall"
  tags = local.default_tags
}

variable "tags" {

  type = map(string)
  default = {
    team = "security-team"
  }
}

locals {
  default_tags = {
    team = "devops-team"
  }
}


locals {
  ingress_rules = [
    { port = 80 },
    { port = 443 }
  ]
}


# resource "aws_security_group" "allow_tls" {
#   name        = "terraform-firewall"
#   description = "Managed from Terraform"
# }

# resource "aws_vpc_security_group_ingress_rule" "app_port" {
#   security_group_id = aws_security_group.allow_tls.id
#   cidr_ipv4         = var.vpn_cidr
#   from_port         = 8080
#   ip_protocol       = "tcp"
#   to_port           = 8080
# }

# resource "aws_vpc_security_group_ingress_rule" "ssh_port" {
#   security_group_id = aws_security_group.allow_tls.id
#   cidr_ipv4         = var.vpn_cidr
#   from_port         = 22
#   ip_protocol       = "tcp"
#   to_port           = 22
# }

# resource "aws_vpc_security_group_ingress_rule" "ftp_port" {
#   security_group_id = aws_security_group.allow_tls.id
#   cidr_ipv4         = var.vpn_cidr
#   from_port         = 21
#   ip_protocol       = "tcp"
#   to_port           = 21
# }


