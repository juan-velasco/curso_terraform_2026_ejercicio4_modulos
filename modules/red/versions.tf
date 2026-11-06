# Un módulo declara qué providers necesita, pero NO los configura:
# el bloque provider (región, credenciales) y el backend van siempre en la configuración raíz.
terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}
