
   resource "aws_launch_template" "mylt" {
        name = "Terraform-LT"
        description = "Terraform code"
        image_id = "ami-05df0ea761147eda6"
        instance_type = "t2.micro"
        key_name = "Ansible"
        placement {
            availability_zone = "us-east-1a"
        }
        vpc_security_group_ids = [aws_security_group.mysg.id]
        user_data = filebase64("/root/netflix/netflix.sh")

    }
}

resource "aws_elb" "myelb" {
    name = "terraformlb"
    subnets = [aws_subnet.mysubnet1.id,aws_subnet.mysubnet2.id]
    security_groups = [aws_security_group.mysg.id]
   listener {
    instance_port = 80
    instance_protocol = "httpd"
    lb_port = 80
    lb_protocol = "http"
   }
   tags = {
    Name = "Terraform-LB"
   }
}

resource "aws_autoscaling_group" "myasg" {
    name = "Terraform-Asg"
    launch_template {
        id = aws_launch_template.mylt.id
    }
    min_size = 2
    max_size = 4
    desired_capacity = 2
    health_check_type = "EC2"
    load_balancer  = [aws_elb.myelb.id]
    vpc_zone_identifier = [aws_subnet.mysubnet1.id,aws_subnet.mysubnet2.id]
}