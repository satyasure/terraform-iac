# Creating 1st EC2 instance in Public Subnet
resource "aws_instance" "workshopinstance" {
  ami                         = "ami-087c17d1fe0178315"
  instance_type               = "t2.micro"
  count                       = 1
  key_name                    = "tests"
  vpc_security_group_ids      = ["${aws_security_group.workshopsg.id}"]
  subnet_id                   = "${aws_subnet.workshopinstance.id}"
  associate_public_ip_address = true
  user_data                   = "${file("data.sh")}"

  tags = {
    Name = "My Public Instance"
  }
}

# Creating 2nd EC2 instance in Public Subnet
resource "aws_instance" "workshopinstance1" {
  ami                         = "ami-087c17d1fe0178315"
  instance_type               = "t2.micro"
  count                       = 1
  key_name                    = "tests"
  vpc_security_group_ids      = ["${aws_security_group.workshopsg.id}"]
  subnet_id                   = "${aws_subnet.workshopinstance.id}"
  associate_public_ip_address = true
  user_data                   = "${file("data.sh")}"

  tags = {
    Name = "My Public Instance 2"
  }
}
