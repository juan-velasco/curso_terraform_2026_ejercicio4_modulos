# Módulo `red`

VPC con una subred pública, Internet Gateway y tabla de rutas.

## Uso

```hcl
module "red" {
  source = "../../modules/red"

  nombre = "ana-lopez"
  zona   = "eu-west-1a"
}
```

## Entradas

| Nombre | Descripción | Obligatoria | Por defecto |
| --- | --- | --- | --- |
| `nombre` | Prefijo de los nombres de los recursos | Sí | — |
| `zona` | Zona de disponibilidad de la subred | Sí | — |
| `vpc_cidr` | Rango de la VPC | No | `10.0.0.0/16` |
| `subred_publica_cidr` | Rango de la subred pública | No | `10.0.1.0/24` |

## Salidas

| Nombre | Descripción |
| --- | --- |
| `vpc_id` | Identificador de la VPC |
| `subred_publica_id` | Identificador de la subred pública |
