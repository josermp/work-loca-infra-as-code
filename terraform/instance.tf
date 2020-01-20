terraform {
  required_version = ">= 0.12.0"
}
provider "aws" {
  region  = "us-east-1"
  version = "~> 2.0"
      
}
resource "aws_instance" "aula_terraform" {
  
  ami               = "ami-07ebfd5b3428b6f4d"
  instance_type     = "t2.micro"
  key_name          = "${aws_key_pair.my-key.key_name}"
  security_groups   = ["${aws_security_group.allow_ssh.name}"]

 tags = {
    Name = "Aula_ec2"
  }
  }
resource "aws_key_pair" "my-key" {
  key_name   = "my-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC60MpEtnIoskTMULVqCdz63kMWJ9hv928t+AlUWoBHNvqiMRYausM/H1zXxT90dO1pvWkrb6v0wu2b0ZB3D+wK+NMbnOyffY2ztSdu0TT2lNiwrIuQ4ljJNl8q0TTY/Wn1kFc5m/YQ7r+vG8qY5YW3Odakpn70lB/W+fqSeYVC6GTIttcx2gDFpT72ADFPSdC2vNo/cRTv5tQE10TNcaDPeYlDBj9NSe7KpMXZDNIeYQ/b+N+S+zNQ0hY/l9dQEzQM1ReWeLwne+Xor/SzZo3R9NKgN4EPiwmFazWpRj0tXLUJcS/kKtCyd3w7Bgn40qfIibUNKR3pXwM9zcyRY6816CF14VCyIbXf7MVBCicaRpSZL5Idzg5iP92ALJY6nxLTU59WDkA/1PvBvfTEmUWX+A/SHo8n8B2AXvHyVvqo3IzFjWE7VRCarjWrzbZAJOe5lwLujgQNLQZnEwdC8c/f0IDMq/e9eUXHCAp0i98byrvdM2bNYOLfMRyPWAHnaudrlNINZD8Xi+KQ1gxde/6itFQ0uEJDckKuU6Tq0D8lz4h2VWvR2yGMGf/UoMkRDpaQapMeRj9BqMsINSBKLQr172heHRU0JaxivPDesiJ92eB8G/1wzSm4tq9VtRb43NhLOkDljVgiFZqQ5sU78sLFLuqjyKbbzlBpCt8QLXEdcw== jose.mundin@cluster2go.com.br"
}

resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "exemplo_public_dns" {
  value = "${aws_instance.aula_terraform.public_dns}"
}
