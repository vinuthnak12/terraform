resouce "aws_security_group" "mysg" {
    name = var.sec_name
    description = "it has all traffic"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cider_blocks = ["0.0.0.0/0"]
    }

    egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cider_blocks = ["0.0.0.0/0"]

    }
}