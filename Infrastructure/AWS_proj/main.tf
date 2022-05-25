provider "aws" {
    region = var.region 
}

variable "region" {
    type = string
    default = "us-east-1"
}
module "vpc" {
    source = "./modules/vpc"
    region = var.region
}

resource "aws_instance" "my_instance" {
    ami = module.vpc.ami_id
    subnet_id = module.vpc.subnet_id
    instance_type = "t2.micro"
    tags = {
        Name = "MY_NEW_INSTANCE"
    }
 }
