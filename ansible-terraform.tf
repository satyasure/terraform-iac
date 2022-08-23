#https://www.opensourcerers.org/2020/10/12/ansible-and-terraform-integration/

provider "aws" {
  access_key = "<your AWS access key>"
  secret_key = "<your AWS secret>"
  region     = "eu-west-3"
}

resource "aws_instance" "application-server1" {
  ami           = "ami-6871a115"
  instance_type = "t2.micro"
  key_name      = "tf_demo_key"
  count         = "2"
}

output "address" {
  value = "${aws_instance.application-server1.*.public_dns}"
}
