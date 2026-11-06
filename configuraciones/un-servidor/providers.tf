# La configuración RAÍZ es la que configura el provider (y, si lo hubiera, el backend).
# Los módulos lo heredan. En este módulo el estado es local, para centrarnos en los módulos.
terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

locals {
  floci = "http://localhost:4566"
}

provider "aws" {
  region = var.region

  access_key                  = var.usar_floci ? "test" : null
  secret_key                  = var.usar_floci ? "test" : null
  skip_credentials_validation = var.usar_floci
  skip_requesting_account_id  = var.usar_floci
  skip_metadata_api_check     = var.usar_floci

  endpoints {
    ec2 = var.usar_floci ? local.floci : null
    sts = var.usar_floci ? local.floci : null
    iam = var.usar_floci ? local.floci : null
  }

  default_tags {
    tags = {
      Curso         = "G2601118"
      Modulo        = "4"
      Configuracion = "un-servidor"
      Owner         = var.prefijo
    }
  }
}
