resource "aws_instance" "myserver" {
    count         = var.icount

    ami           = var.ami_id
    instance_type = var.itype
    key_name      = var.ikey

    root_block_device {
        volume_size = var.volume
    }

    tags = {
        Name = var.iname
    }
}