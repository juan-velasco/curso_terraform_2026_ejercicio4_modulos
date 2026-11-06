# Módulo `servidor_web`

Grupo de seguridad con HTTP de entrada y una instancia EC2 con nginx que muestra una página con su nombre y un mensaje.

## Uso

```hcl
module "web" {
  source = "../../modules/servidor_web"

  nombre    = "ana-lopez-web"
  vpc_id    = module.red.vpc_id
  subred_id = module.red.subred_publica_id

  depends_on = [module.red]
}
```

## Entradas

| Nombre | Descripción | Obligatoria | Por defecto |
| --- | --- | --- | --- |
| `nombre` | Nombre del servidor y prefijo del grupo de seguridad | Sí | — |
| `vpc_id` | VPC del grupo de seguridad | Sí | — |
| `subred_id` | Subred pública de la instancia | Sí | — |
| `tipo_instancia` | Tipo de instancia EC2 | No | `t3.micro` |
| `mensaje` | Texto de la página web | No | «Servidor creado con un módulo de Terraform» |
| `ami_id` | AMI (solo con Floci) | No | Ubuntu 24.04 |

## Salidas

| Nombre | Descripción |
| --- | --- |
| `instancia_id` | Identificador de la instancia |
| `ip_publica` | IP pública |
| `url` | Dirección del servidor web |
| `sg_id` | Identificador del grupo de seguridad |
