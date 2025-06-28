resource "aws_subnet" "mysubnet1" {
tags = {
    Name = "Subnet-1"
}
vpc_id = aws_vpc.myvpc.id
cidr_block = "10.0.0.0/24"
map_public_ip_on_launch = "true"
availability_zone = "us-east-2a"

}
resource "aws_subnet" "mysubnet2" {
tags = {
    Name = "Subnet-2"
}
vpc_id = aws_vpc.myvpc.id
cidr_block = "10.0.0.0/24"
map_public_ip_on_launch = "true"
availability_zone = "us-east-2b"

}
