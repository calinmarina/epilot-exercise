output route_zone_id {
    value = data.aws_route53_zone.route_zone.zone_id
}

output certificate_arn {
    value = aws_acm_certificate.cert.arn
}