# MÓDULO servidor_web · Grupo de seguridad (HTTP) e instancia EC2 con nginx
# Es el servidor de los módulos 2 y 3. Sustituye cada ___ por la variable (var.<nombre>) que corresponda.

# Imagen de Ubuntu 24.04 publicada por Canonical (solo si no se indica ami_id)
data "aws_ami" "ubuntu" {
  count       = var.ami_id == null ? 1 : 0
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}

locals {
  ami = coalesce(var.ami_id, one(data.aws_ami.ubuntu[*].id))
}

resource "aws_security_group" "web" {
  name        = "${var.nombre}-sg"
  description = "Servidor web: HTTP de entrada y toda la salida"
  vpc_id      = ___

  tags = {
    Name = "${var.nombre}-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.web.id
  description       = "HTTP"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "todo" {
  security_group_id = aws_security_group.web.id
  description       = "Toda la salida"
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_instance" "web" {
  ami                         = local.ami
  instance_type               = ___
  subnet_id                   = ___
  vpc_security_group_ids      = [aws_security_group.web.id]
  user_data_replace_on_change = true

  user_data = <<-EOT
    #!/bin/bash
    apt-get update -y
    apt-get install -y nginx
    echo "<h1>${var.nombre}</h1><p>${var.mensaje}</p>" > /var/www/html/index.html
    systemctl enable --now nginx
  EOT

  tags = {
    Name = ___
  }
}
