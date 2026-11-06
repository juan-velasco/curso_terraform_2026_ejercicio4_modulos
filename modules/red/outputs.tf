# Lo que el módulo expone a quien lo llama: module.<nombre>.<output>

output "vpc_id" {
  description = "Identificador de la VPC"
  value       = aws_vpc.principal.id
}

output "subred_publica_id" {
  description = "Identificador de la subred pública"
  value       = aws_subnet.publica.id
}
