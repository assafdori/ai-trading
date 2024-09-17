module "zones" {
  source  = "../modules/route53"

  zones = var.zones

  tags = var.tags
}

module "records" {
  source  = "../modules/route53"

  zone_name = var.zone_name

  records = var.records

  depends_on = [module.zones]
}
