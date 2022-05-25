provider "aws" {
    region = "var.region" 
}

variable "region" {
    type = string
    default = "us-east-1"
}
module "vpc" {
    source = "./modules"
    region = var.region
}

resource "aws_instance" "my_instance" {
    ami = module.ami_id
    subnet_id = module.subnet_id
    instance_type = "t2.micro"
        }
