# Ejercicio 4.1 · Módulo reutilizable con recursos AWS

Curso G2601118 · Infraestructura como código con Terraform · Módulo 4

La red y el servidor de los módulos anteriores, convertidos en **módulos reutilizables** y usados desde dos configuraciones distintas. En este módulo el estado es **local**.

| Carpeta | Contenido | Estado |
| --- | --- | --- |
| `modules/red/` | Paso 1: módulo de red | Resuelto |
| `modules/servidor_web/` | Paso 2: módulo de servidor web | Completar |
| `configuraciones/un-servidor/` | Paso 3: una red y un servidor | Resuelto |
| `configuraciones/dos-servidores/` | Paso 4: una red y dos servidores | Completar |
| `reto-registry/` | Reto opcional: VPC del Terraform Registry (solo AWS) | Opcional |

Mientras queden huecos `___`, `terraform validate` dará error: es normal.

## Cómo trabajar

Cada configuración se despliega desde su carpeta:

```bash
cd configuraciones/un-servidor
cp terraform.tfvars.example terraform.tfvars   # y rellénalo
terraform init        # descarga (copia) los módulos en .terraform/modules
terraform apply
terraform state list  # direcciones module.red... y module.web...
terraform destroy
```

Repite lo mismo en `configuraciones/dos-servidores`.

Si cambias algo dentro de un módulo, afecta a **todas** las configuraciones que lo usan: compruébalo con `terraform plan` en cada una.

## Con Floci

Pon `usar_floci = true` e indica `ami_id` en el `terraform.tfvars` de cada configuración. El reto del Registry es solo para AWS.

## Reglas de oro

- **Destruye siempre** lo que crees: `dos-servidores` crea dos instancias con IP pública.
- **Nunca subas** credenciales, `terraform.tfvars` ni ficheros `*.tfstate` (ya están en `.gitignore`).
