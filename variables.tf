

variable "vpn_cidr" {
  description = "The CIDR block for firewall rules"
  type        = string
}

variable "instance_type" {}


variable "environment" {
  default = "dev"
}

resource "aws_instance" "ec2" {
  ami           = "ami-0aa7db6294d00216f"
  instance_type = var.environment == "prod" ? "m5.large" : "t2.micro"
}

variable "hello" {
  type    = string
  default = "world"
}

variable "worlds" {
  type = list(string)
}

variable "worlds_map" {
  type = map(string)
}

variable "worlds_splat" {
  type = list(map(string))
}

// Collection Types

variable "list" {
  type = list(string)
  default= ["Earth", "Mars", "Venus"]
}

variable "map" {
  type = map(string)
  default = {
    Earth = "Blue Planet"
    Mars  = "Red Planet"
    Venus = "Hot Planet"
  }
}

variable "my_structural_type"{
  type = object({
    name    = string
    age     = number
    married = optional (bool)
  })

  default = {
    name    = "Dilip"
    age     = 34
    married = true
  }
}




variable "my_tuple" {
  type = tuple([string, number, bool])

  default = ["Deepa", 30, true]
}