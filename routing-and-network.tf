# Declare the data source
data "aws_availability_zones" "available" {}

/* EXTERNAL NETWORG , IG, ROUTE TABLE */
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.mainvpc.id}"

  tags = {
    Name = "IGW-MainVPC-Ohio"
  }
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.mainvpc.id}"

  tags = {
    Name = "Public"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
}

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.mainvpc.id}"

  tags = {
    Name = "Private"
  }

  #  route {
  #    cidr_block     = "0.0.0.0/0"
  #    nat_gateway_id = "${aws_nat_gateway.PublicAZA.id}"
  #  }
}
