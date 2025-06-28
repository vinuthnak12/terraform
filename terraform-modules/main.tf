module "myinstance" {
    source = "./instance"
    iname = "Module-server"
    ami_id = "ami-05df0ea761147eda6"
    itype = "t2.micro"
    volume = 10
    icount = 1
    ikey = "Ansible"
}

module "mys3" {
    source = "./s3"
    bucket_name = "terraform.modules.s3.bucket.vish"
}

module "mysecurity" {
    source = "./security"
    sec_name = "terraform-module-sg"

}