provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "myserver" {
    ami = "ami-0220d79f3f480ecf5"
    instance_type = "t3.micro"
}

resource "aws_security_group" "new_terraform" {
    egress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
    }

    ingress{
        from_port = 80
        to_port = 80
        protocol = "http"

    }
}

# creating r53 record by own
resource "aws_route53_record" "rakesh" {
    zone_id = "Z03367111M5B9ONUM8AIS"
    name = "test_your_domain"
    type = "A"
    ttl = 300
    records = [aws_instance.myserver.public_ip]
  
}