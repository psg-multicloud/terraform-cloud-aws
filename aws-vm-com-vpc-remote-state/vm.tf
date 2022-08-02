#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

resource "aws_key_pair" "key-vm01" {
  key_name   = "key-vm01"
  public_key = file("./key-vm01.pub")
}
resource "aws_instance" "vm01" {
  ami                         = "ami-090fa75af13c156b4"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key-vm01.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet_id
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.security_group_id]
  associate_public_ip_address = true

  tags = {
    "Name" = "vm-01-terraform"
  }
}