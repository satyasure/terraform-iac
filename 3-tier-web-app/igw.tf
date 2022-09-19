# Creating Internet Gateway 
resource "aws_internet_gateway" "workshopgateway" {
  vpc_id = "${aws_vpc.workshop.id}"
}