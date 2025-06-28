resource "aws_instance" "myserver {
    tags = {
        Name = var.iname
    }

    ami = var.ami_id
    instance_type = var.itype
    key_name = var.ikey
    root_block_device {
        volume_size = var.volume
    }
    var.icount
} 