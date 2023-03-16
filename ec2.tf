resource "aws_instance" "Ilitia" {
  
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = var.subnet_ids[0]
  key_name        = var.ssh_key
  security_groups = var.group_id

  tags = {
    Name = var.name
  }
}

resource "aws_eip" "my_eip" {
  vpc = true # Replace with `false` if you're not using a VPC
}

resource "aws_eip_association" "my_eip_association" {
  instance_id   = aws_instance.Ilitia.id
  allocation_id = aws_eip.my_eip.id
}