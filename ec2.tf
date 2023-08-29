provider "aws" {
region = "eu-north-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0989fb15ce71ba39e"
  instance_type = "t3.micro"
  key_name = "test"
  for_each = toset(["master", "slave", "1", "2"])
   tags = {
     Name = "${each.key}"
   }
}