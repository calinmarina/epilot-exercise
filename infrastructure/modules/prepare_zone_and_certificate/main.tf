locals {
  subdomain = join(".", ["www", var.domain_name])
  common_tags = {
    project = var.domain_name
    env     = var.env
  }
}

data "aws_route53_zone" "route_zone" {
  name = var.domain_name
}

provider "aws" {
  # The ACM Certificate can only be created in US-EAST-1
  # see: https://www.terraform.io/docs/providers/aws/r/cloudfront_distribution.html#acm_certificate_arn
  region = "us-east-1"
  alias  = "acm_certificate_must_be_in_virginia"
}

resource "aws_acm_certificate" "cert" {
  provider                  = aws.acm_certificate_must_be_in_virginia
  domain_name               = var.domain_name
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
  zone_id = data.aws_route53_zone.route_zone.zone_id
  ttl     = 60
}

resource "aws_route53_record" "cert_validation_subdomain" {
  name    = aws_acm_certificate.cert.domain_validation_options.1.resource_record_name
  type    = aws_acm_certificate.cert.domain_validation_options.1.resource_record_type
  records = [aws_acm_certificate.cert.domain_validation_options.1.resource_record_value]
  zone_id = data.aws_route53_zone.route_zone.zone_id
  ttl     = 60
}

resource "aws_acm_certificate_validation" "cert" {
  provider                = aws.acm_certificate_must_be_in_virginia
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [aws_route53_record.cert_validation_domain.fqdn, aws_route53_record.cert_validation_subdomain.fqdn]

  timeouts {
    create = "60m"
  }
}