# PASO 3 · Configuración un-servidor (ya resuelta: úsala como modelo)
# Una red y un servidor web, construidos con los dos módulos.

module "red" {
  source = "../../modules/red"

  nombre = "${var.prefijo}-uno"
  zona   = var.zona
}

module "web" {
  source = "../../modules/servidor_web"

  nombre    = "${var.prefijo}-web"
  vpc_id    = module.red.vpc_id
  subred_id = module.red.subred_publica_id
  ami_id    = var.ami_id

  # La instancia descarga nginx al arrancar: debe esperar a que la red tenga salida
  # a Internet. Como los recursos están dentro de otro módulo, la dependencia se
  # declara entre módulos.
  depends_on = [module.red]
}
