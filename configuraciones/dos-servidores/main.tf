# PASO 4 · Configuración dos-servidores
# La misma red y DOS servidores: el mismo módulo llamado dos veces,
# con un nombre de bloque distinto y nombres de recurso distintos.

# Red (ya resuelta)
module "red" {
  source = "../../modules/red"

  nombre = "${var.prefijo}-dos"
  zona   = var.zona
}

# Servidor A (complétalo)
module "web_a" {
  source = ___ # ruta al módulo servidor_web, como en un-servidor

  nombre    = ___ # "<prefijo>-web-a"
  vpc_id    = ___ # output vpc_id del módulo red
  subred_id = ___ # output subred_publica_id del módulo red
  mensaje   = "Soy el servidor A"
  ami_id    = var.ami_id

  depends_on = [module.red]
}

# Servidor B: escríbelo tú, copiando el A y cambiando lo necesario.
# Usa el nombre de bloque web_b, el nombre "<prefijo>-web-b" y el mensaje "Soy el servidor B".
