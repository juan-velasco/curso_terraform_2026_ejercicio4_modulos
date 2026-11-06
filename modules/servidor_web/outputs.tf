# PASO 2 · Lo que el módulo expone a quien lo llama (complétalo)

output "instancia_id" {
  description = "Identificador de la instancia EC2"
  value       = aws_instance.web.id
}

output "ip_publica" {
  description = "IP pública del servidor"
  value       = ___ # atributo public_ip de la instancia
}

output "url" {
  description = "Dirección del servidor web (espera 1-2 minutos tras el apply)"
  value       = ___ # "http://<ip pública>" con interpolación
}

output "sg_id" {
  description = "Identificador del grupo de seguridad"
  value       = ___
}
