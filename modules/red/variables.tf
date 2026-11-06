# Interfaz del módulo: lo que quien lo llama puede (o debe) indicar

variable "nombre" {
  description = "Prefijo para los nombres de los recursos (ej.: ana-lopez)"
  type        = string
}

variable "zona" {
  description = "Zona de disponibilidad de la subred pública (ej.: eu-west-1a)"
  type        = string
}

variable "vpc_cidr" {
  description = "Rango de direcciones de la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subred_publica_cidr" {
  description = "Rango de direcciones de la subred pública (dentro de la VPC)"
  type        = string
  default     = "10.0.1.0/24"
}
