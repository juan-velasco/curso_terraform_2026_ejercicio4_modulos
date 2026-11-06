# RETO OPCIONAL (solo AWS) · Usar un módulo del Terraform Registry
# Sustituye nuestro módulo red por terraform-aws-modules/vpc/aws y conecta el servidor.
# Documentación: https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws

# Pistas:
#   - source = "terraform-aws-modules/vpc/aws" y version = "~> 6.0"
#   - Argumentos: name, cidr, azs (lista), public_subnets (lista),
#     map_public_ip_on_launch = true y enable_nat_gateway = false (el NAT tiene coste)
#   - Outputs que necesitas: vpc_id y public_subnets (es una LISTA: usa [0])

module "vpc" {
  source  = ___
  version = ___

  name = "${var.prefijo}-registry"
  cidr = "10.0.0.0/16"

  azs            = ___
  public_subnets = ___

  map_public_ip_on_launch = true
  enable_nat_gateway      = false
}

module "web" {
  source = "../modules/servidor_web"

  nombre    = "${var.prefijo}-web-registry"
  vpc_id    = ___
  subred_id = ___
  mensaje   = "Red creada con un módulo del Registry"
  ami_id    = var.ami_id

  depends_on = [module.vpc]
}
