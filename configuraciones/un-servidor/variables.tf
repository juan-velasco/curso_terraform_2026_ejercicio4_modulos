variable "region" {
  description = "Región de AWS"
  type        = string
  default     = "eu-west-1"
}

variable "usar_floci" {
  description = "true para trabajar en local con Floci; false para usar AWS"
  type        = bool
  default     = false
}

variable "prefijo" {
  description = "Tu nombre y apellido en minúsculas y con guiones (ej.: ana-lopez)"
  type        = string
}

variable "zona" {
  description = "Zona de disponibilidad de la subred"
  type        = string
  default     = "eu-west-1a"
}

variable "ami_id" {
  description = "Déjalo vacío en AWS. Con Floci, indica una AMI de las que muestra Floci UI."
  type        = string
  default     = null
}
