output "url" {
  description = "Dirección del servidor web"
  value       = module.web.url
}

output "ip_publica" {
  description = "IP pública del servidor"
  value       = module.web.ip_publica
}
