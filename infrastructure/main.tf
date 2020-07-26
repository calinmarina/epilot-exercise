locals {
  # Maps file extensions to mime types
  mime_type_mappings = {
    html = "text/html",
    js   = "text/javascript",
    css  = "text/css",
    json = "application/json"
    svg  = "image/svg+xml",
    png  = "image/png"
  }
}

module "prepare_zone_and_certificate" {
  source = "./modules/prepare_zone_and_certificate"
  domain_name = var.domain_name
  env = var.env
  region = var.region
}

module "aws_s3_hosted_spa_infra_template" {
  source = "git::git@github.com:calinmarina/tf_aws_hosted_spa_infra_template_module.git?ref=master"
  domain = {
    "name" : var.domain_name,
    "zone_id" : module.prepare_zone_and_certificate.route_zone_id
  }
  certificate_arn = module.prepare_zone_and_certificate.certificate_arn
}

# Upload content to S3 bucket
resource "aws_s3_bucket_object" "webapp" {
  for_each = fileset("../build", "*")

  bucket       = module.aws_s3_hosted_spa_infra_template.s3_bucket
  key          = each.value
  source       = "../build/${each.value}"
  content_type = lookup(local.mime_type_mappings, concat(regexall("\\.([^\\.]*)$", each.value), [[""]])[0][0], "application/octet-stream")
  etag         = filemd5("../build/${each.value}")
}

resource "aws_s3_bucket_object" "webapp-static" {
  for_each = fileset("../build/static", "**")

  bucket       = module.aws_s3_hosted_spa_infra_template.s3_static_bucket
  key          = "static/${each.value}"
  source       = "../build/static/${each.value}"
  content_type = lookup(local.mime_type_mappings, concat(regexall("\\.([^\\.]*)$", each.value), [[""]])[0][0], "application/octet-stream")
  etag         = filemd5("../build/static/${each.value}")
}
