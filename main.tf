resource "aws_instance" "web" {
  ami           = "ami-002070d43b0a4f171"
  instance_type = "t2.micro"
  key_name   = "centos7"
   

  tags = {
    Name = "web"
  }
}

resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1d"
  size              = 20

   }

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.web.id
}