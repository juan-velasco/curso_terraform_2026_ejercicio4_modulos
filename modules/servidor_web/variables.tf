# PASO 2 · Interfaz del módulo servidor_web (complétala)
# Las variables sin default son OBLIGATORIAS para quien llama al módulo.

# Ya resuelta: úsala como modelo
variable "nombre" {
  description = "Nombre del servidor; también prefijo del grupo de seguridad (ej.: ana-lopez-web)"
  type        = string
}

# Obligatoria: VPC donde se crea el grupo de seguridad
variable "vpc_id" {
  description = "VPC donde se crea el grupo de seguridad"
  type        = ___
}

# Obligatoria: subred donde arranca la instancia
variable "subred_id" {
  description = ___
  type        = string
}

# Opcional: tipo de instancia, por defecto "t3.micro"
variable "tipo_instancia" {
  description = "Tipo de instancia EC2"
  type        = string
  default     = ___
}

# Opcional: texto de la página web
variable "mensaje" {
  description = "Texto que muestra la página web del servidor"
  type        = string
  default     = "Servidor creado con un módulo de Terraform"
}

# Opcional: AMI (ya resuelta)
variable "ami_id" {
  description = "Déjalo vacío en AWS (se busca Ubuntu 24.04). Con Floci, indica una AMI de las que muestra Floci UI."
  type        = string
  default     = null
}
