locals {
  subdomain = join(".", ["www", var.domain])
  common_tags = {
    project = var.domain
    env     = var.env
  }
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

# Reuse existing zone to avoid allocation of different name servers after rebuild
# while domain name is still in process of migration from GoDaddy to AWS
resource "aws_route53_zone" "route_zone" {
  name = var.domain
  tags = local.common_tags
}

resource "aws_acm_certificate" "cert" {
  provider                  = aws.acm_certificate_must_be_in_virginia
  domain_name               = var.domain
  subject_alternative_names = [local.subdomain]
  validation_method         = "DNS"
  tags                      = local.common_tags

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "cert_validation_domain" {
  name    = aws_acm_certificate.cert.domain_validation_options.0.resource_record_name
  type    = aws_acm_certificate.cert.domain_validation_options.0.resource_record_type
  records = [aws_acm_certificate.cert.domain_validation_options.0.resource_record_value]
  zone_id = aws_route53_zone.route_zone.zone_id
  ttl     = 60
}

resource "aws_route53_record" "cert_validation_subdomain" {
  name    = aws_acm_certificate.cert.domain_validation_options.1.resource_record_name
  type    = aws_acm_certificate.cert.domain_validation_options.1.resource_record_type
  records = [aws_acm_certificate.cert.domain_validation_options.1.resource_record_value]
  zone_id = aws_route53_zone.route_zone.zone_id
  ttl     = 60
}

resource "aws_acm_certificate_validation" "cert" {
  provider                = aws.acm_certificate_must_be_in_virginia
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [aws_route53_record.cert_validation_domain.fqdn, aws_route53_record.cert_validation_subdomain.fqdn]
}

module "aws_s3_hosted_spa_infra_template" {
  source = "git::git@github.com:calinmarina/tf_aws_hosted_spa_infra_template_module.git?ref=master"
  domain = {
    "name" : var.domain,
    "zone_id" : aws_route53_zone.route_zone.zone_id
  }
  certificate_arn = aws_acm_certificate.cert.arn
}

# Upload content to S3 bucket
# Note: terraform 0.12.8 needed for this to work otherwise use 
# null_resource with 'aws s3' cli command for prev versions
resource "aws_s3_bucket_object" "webapp" {
  for_each = fileset("./build", "*")

  bucket       = module.aws_s3_hosted_spa_infra_template.s3_bucket
  key          = each.value
  source       = "./build/${each.value}"
  content_type = lookup(local.mime_type_mappings, concat(regexall("\\.([^\\.]*)$", each.value), [[""]])[0][0], "application/octet-stream")
  etag         = filemd5("./build/${each.value}")
}

resource "aws_s3_bucket_object" "webapp-static" {
  for_each = fileset("./build/static", "**")

  bucket       = module.aws_s3_hosted_spa_infra_template.s3_static_bucket
  key          = "static/${each.value}"
  source       = "./build/static/${each.value}"
  content_type = lookup(local.mime_type_mappings, concat(regexall("\\.([^\\.]*)$", each.value), [[""]])[0][0], "application/octet-stream")
  etag         = filemd5("./build/static/${each.value}")
}
