provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "myserver" {
    ami = "ami-0220d79f3f480ecf5"
    instance_type = "t3.micro"
}

resource "security_group_id" "new terraform" {
    ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
    }
  
   ingress{
    for_port = 80
    to_port = 80
    protocol = "http"
    
   }
}