```bash
epilot-exercise/infrastructure on  zoneAndCertInModule [⇣!?] via 💠 default 
❯ terraform apply -var 'domain_name=marinaconsult.co.uk'
module.prepare_zone_and_certificate.data.aws_route53_zone.route_zone: Refreshing state...

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_s3_bucket_object.webapp["asset-manifest.json"] will be created
  + resource "aws_s3_bucket_object" "webapp" {
      + acl                    = "private"
      + bucket                 = "marinaconsult.co.uk"
      + content_type           = "application/json"
      + etag                   = "a9cbf6881d9173bbb3ada9bb73fcece2"
      + force_destroy          = false
      + id                     = (known after apply)
      + key                    = "asset-manifest.json"
      + server_side_encryption = (known after apply)
      + source                 = "../build/asset-manifest.json"
      + storage_class          = (known after apply)
      + version_id             = (known after apply)
    }

  # aws_s3_bucket_object.webapp["favicon.ico"] will be created
  + resource "aws_s3_bucket_object" "webapp" {
      + acl                    = "private"
      + bucket                 = "marinaconsult.co.uk"
      + content_type           = "application/octet-stream"
      + etag                   = "6e1267d9d946b0236cdf6ffd02890894"
      + force_destroy          = false
      + id                     = (known after apply)
      + key                    = "favicon.ico"
      + server_side_encryption = (known after apply)
      + source                 = "../build/favicon.ico"
      + storage_class          = (known after apply)
      + version_id             = (known after apply)
    }

  # aws_s3_bucket_object.webapp["index.html"] will be created
  + resource "aws_s3_bucket_object" "webapp" {
      + acl                    = "private"
      + bucket                 = "marinaconsult.co.uk"
      + content_type           = "text/html"
      + etag                   = "9acfd78dff95590c3e9f1ee7202f7fb0"
      + force_destroy          = false
      + id                     = (known after apply)
      + key                    = "index.html"
      + server_side_encryption = (known after apply)
      + source                 = "../build/index.html"
      + storage_class          = (known after apply)
      + version_id             = (known after apply)
    }

  # aws_s3_bucket_object.webapp["logo192.png"] will be created
  + resource "aws_s3_bucket_object" "webapp" {
      + acl                    = "private"
      + bucket                 = "marinaconsult.co.uk"
      + content_type           = "image/png"
      + etag                   = "33dbdd0177549353eeeb785d02c294af"
      + force_destroy          = false
      + id                     = (known after apply)
      + key                    = "logo192.png"
      + server_side_encryption = (known after apply)
      + source                 = "../build/logo192.png"
      + storage_class          = (known after apply)
      + version_id             = (known after apply)
    }

  # aws_s3_bucket_object.webapp["logo512.png"] will be created
  + resource "aws_s3_bucket_object" "webapp" {
      + acl                    = "private"
      + bucket                 = "marinaconsult.co.uk"
      + content_type           = "image/png"
      + etag                   = "917515db74ea8d1aee6a246cfbcc0b45"
      + force_destroy          = false
      + id                     = (known after apply)
      + key                    = "logo512.png"
      + server_side_encryption = (known after apply)
      + source                 = "../build/logo512.png"
      + storage_class          = (known after apply)
      + version_id             = (known after apply)
    }

  # aws_s3_bucket_object.webapp["manifest.json"] will be created
  + resource "aws_s3_bucket_object" "webapp" {
      + acl                    = "private"
      + bucket                 = "marinaconsult.co.uk"
      + content_type           = "application/json"
      + etag                   = "d9d975cebe2ec20b6c652e1e4c12ccf0"
      + force_destroy          = false
      + id                     = (known after apply)
      + key                    = "manifest.json"
      + server_side_encryption = (known after apply)
      + source                 = "../build/manifest.json"
      + storage_class          = (known after apply)
      + version_id             = (known after apply)
    }

  # aws_s3_bucket_object.webapp["precache-manifest.4a9dcd9203673a7cf782503d77102e83.js"] will be created
  + resource "aws_s3_bucket_object" "webapp" {
      + acl                    = "private"
      + bucket                 = "marinaconsult.co.uk"
      + content_type           = "text/javascript"
      + etag                   = "4a9dcd9203673a7cf782503d77102e83"
      + force_destroy          = false
      + id                     = (known after apply)
      + key                    = "precache-manifest.4a9dcd9203673a7cf782503d77102e83.js"
      + server_side_encryption = (known after apply)
      + source                 = "../build/precache-manifest.4a9dcd9203673a7cf782503d77102e83.js"
      + storage_class          = (known after apply)
      + version_id             = (known after apply)
    }

  # aws_s3_bucket_object.webapp["robots.txt"] will be created
  + resource "aws_s3_bucket_object" "webapp" {
      + acl                    = "private"
      + bucket                 = "marinaconsult.co.uk"
      + content_type           = "application/octet-stream"
      + etag                   = "fa1ded1ed7c11438a9b0385b1e112850"
      + force_destroy          = false
      + id                     = (known after apply)
      + key                    = "robots.txt"
      + server_side_encryption = (known after apply)
      + source                 = "../build/robots.txt"
      + storage_class          = (known after apply)
      + version_id             = (known after apply)
    }

  # aws_s3_bucket_object.webapp["service-worker.js"] will be created
  + resource "aws_s3_bucket_object" "webapp" {
      + acl                    = "private"
      + bucket                 = "marinaconsult.co.uk"
      + content_type           = "text/javascript"
      + etag                   = "ed1cd2726214c1141dcc5cdcb19fda79"
      + force_destroy          = false
      + id                     = (known after apply)
      + key                    = "service-worker.js"
      + server_side_encryption = (known after apply)
      + source                 = "../build/service-worker.js"
      + storage_class          = (known after apply)
      + version_id             = (known after apply)
    }

  # aws_s3_bucket_object.webapp-static["css/main.5f361e03.chunk.css"] will be created
  + resource "aws_s3_bucket_object" "webapp-static" {
      + acl                    = "private"
      + bucket                 = "marinaconsult.co.uk-static"
      + content_type           = "text/css"
      + etag                   = "1472653e7cd5f55fc8eabda93770382e"
      + force_destroy          = false
      + id                     = (known after apply)
      + key                    = "static/css/main.5f361e03.chunk.css"
      + server_side_encryption = (known after apply)
      + source                 = "../build/static/css/main.5f361e03.chunk.css"
      + storage_class          = (known after apply)
      + version_id             = (known after apply)
    }

  # aws_s3_bucket_object.webapp-static["css/main.5f361e03.chunk.css.map"] will be created
  + resource "aws_s3_bucket_object" "webapp-static" {
      + acl                    = "private"
      + bucket                 = "marinaconsult.co.uk-static"
      + content_type           = "application/octet-stream"
      + etag                   = "d77b02e4e19dcce38796c6451792b5d4"
      + force_destroy          = false
      + id                     = (known after apply)
      + key                    = "static/css/main.5f361e03.chunk.css.map"
      + server_side_encryption = (known after apply)
      + source                 = "../build/static/css/main.5f361e03.chunk.css.map"
      + storage_class          = (known after apply)
      + version_id             = (known after apply)
    }

  # aws_s3_bucket_object.webapp-static["js/2.a54d78d9.chunk.js"] will be created
  + resource "aws_s3_bucket_object" "webapp-static" {
      + acl                    = "private"
      + bucket                 = "marinaconsult.co.uk-static"
      + content_type           = "text/javascript"
      + etag                   = "e09e87065a0cd678e866952ed93ca58f"
      + force_destroy          = false
      + id                     = (known after apply)
      + key                    = "static/js/2.a54d78d9.chunk.js"
      + server_side_encryption = (known after apply)
      + source                 = "../build/static/js/2.a54d78d9.chunk.js"
      + storage_class          = (known after apply)
      + version_id             = (known after apply)
    }

  # aws_s3_bucket_object.webapp-static["js/2.a54d78d9.chunk.js.LICENSE.txt"] will be created
  + resource "aws_s3_bucket_object" "webapp-static" {
      + acl                    = "private"
      + bucket                 = "marinaconsult.co.uk-static"
      + content_type           = "application/octet-stream"
      + etag                   = "e88a3e95b5364d46e95b35ae8c0dc27d"
      + force_destroy          = false
      + id                     = (known after apply)
      + key                    = "static/js/2.a54d78d9.chunk.js.LICENSE.txt"
      + server_side_encryption = (known after apply)
      + source                 = "../build/static/js/2.a54d78d9.chunk.js.LICENSE.txt"
      + storage_class          = (known after apply)
      + version_id             = (known after apply)
    }

  # aws_s3_bucket_object.webapp-static["js/2.a54d78d9.chunk.js.map"] will be created
  + resource "aws_s3_bucket_object" "webapp-static" {
      + acl                    = "private"
      + bucket                 = "marinaconsult.co.uk-static"
      + content_type           = "application/octet-stream"
      + etag                   = "d57bd67405ee7645c3febde8b188e00f"
      + force_destroy          = false
      + id                     = (known after apply)
      + key                    = "static/js/2.a54d78d9.chunk.js.map"
      + server_side_encryption = (known after apply)
      + source                 = "../build/static/js/2.a54d78d9.chunk.js.map"
      + storage_class          = (known after apply)
      + version_id             = (known after apply)
    }

  # aws_s3_bucket_object.webapp-static["js/main.ef632a7d.chunk.js"] will be created
  + resource "aws_s3_bucket_object" "webapp-static" {
      + acl                    = "private"
      + bucket                 = "marinaconsult.co.uk-static"
      + content_type           = "text/javascript"
      + etag                   = "dbe7e8e963fcb0b396f2f9a717f7fdf5"
      + force_destroy          = false
      + id                     = (known after apply)
      + key                    = "static/js/main.ef632a7d.chunk.js"
      + server_side_encryption = (known after apply)
      + source                 = "../build/static/js/main.ef632a7d.chunk.js"
      + storage_class          = (known after apply)
      + version_id             = (known after apply)
    }

  # aws_s3_bucket_object.webapp-static["js/main.ef632a7d.chunk.js.map"] will be created
  + resource "aws_s3_bucket_object" "webapp-static" {
      + acl                    = "private"
      + bucket                 = "marinaconsult.co.uk-static"
      + content_type           = "application/octet-stream"
      + etag                   = "f1365519411835aeb3d7a00888d7f1b8"
      + force_destroy          = false
      + id                     = (known after apply)
      + key                    = "static/js/main.ef632a7d.chunk.js.map"
      + server_side_encryption = (known after apply)
      + source                 = "../build/static/js/main.ef632a7d.chunk.js.map"
      + storage_class          = (known after apply)
      + version_id             = (known after apply)
    }

  # aws_s3_bucket_object.webapp-static["js/runtime-main.f5bdaf34.js"] will be created
  + resource "aws_s3_bucket_object" "webapp-static" {
      + acl                    = "private"
      + bucket                 = "marinaconsult.co.uk-static"
      + content_type           = "text/javascript"
      + etag                   = "19b504c9abf8ea9a89ec3980f8b114b6"
      + force_destroy          = false
      + id                     = (known after apply)
      + key                    = "static/js/runtime-main.f5bdaf34.js"
      + server_side_encryption = (known after apply)
      + source                 = "../build/static/js/runtime-main.f5bdaf34.js"
      + storage_class          = (known after apply)
      + version_id             = (known after apply)
    }

  # aws_s3_bucket_object.webapp-static["js/runtime-main.f5bdaf34.js.map"] will be created
  + resource "aws_s3_bucket_object" "webapp-static" {
      + acl                    = "private"
      + bucket                 = "marinaconsult.co.uk-static"
      + content_type           = "application/octet-stream"
      + etag                   = "895d62ae8f3096fce50faa8bc25ba39e"
      + force_destroy          = false
      + id                     = (known after apply)
      + key                    = "static/js/runtime-main.f5bdaf34.js.map"
      + server_side_encryption = (known after apply)
      + source                 = "../build/static/js/runtime-main.f5bdaf34.js.map"
      + storage_class          = (known after apply)
      + version_id             = (known after apply)
    }

  # aws_s3_bucket_object.webapp-static["media/logo.5d5d9eef.svg"] will be created
  + resource "aws_s3_bucket_object" "webapp-static" {
      + acl                    = "private"
      + bucket                 = "marinaconsult.co.uk-static"
      + content_type           = "image/svg+xml"
      + etag                   = "5d5d9eefa31e5e13a6610d9fa7a283bb"
      + force_destroy          = false
      + id                     = (known after apply)
      + key                    = "static/media/logo.5d5d9eef.svg"
      + server_side_encryption = (known after apply)
      + source                 = "../build/static/media/logo.5d5d9eef.svg"
      + storage_class          = (known after apply)
      + version_id             = (known after apply)
    }

  # module.aws_s3_hosted_spa_infra_template.aws_cloudfront_distribution.s3Distribution will be created
  + resource "aws_cloudfront_distribution" "s3Distribution" {
      + active_trusted_signers         = (known after apply)
      + aliases                        = [
          + "marinaconsult.co.uk",
          + "www.marinaconsult.co.uk",
        ]
      + arn                            = (known after apply)
      + caller_reference               = (known after apply)
      + default_root_object            = "index.html"
      + domain_name                    = (known after apply)
      + enabled                        = true
      + etag                           = (known after apply)
      + hosted_zone_id                 = (known after apply)
      + http_version                   = "http2"
      + id                             = (known after apply)
      + in_progress_validation_batches = (known after apply)
      + is_ipv6_enabled                = true
      + last_modified_time             = (known after apply)
      + price_class                    = "PriceClass_All"
      + retain_on_delete               = false
      + status                         = (known after apply)
      + tags                           = {
          + "env"     = "production"
          + "project" = "marinaconsult.co.uk"
        }
      + wait_for_deployment            = true

      + default_cache_behavior {
          + allowed_methods        = [
              + "DELETE",
              + "GET",
              + "HEAD",
              + "OPTIONS",
              + "PATCH",
              + "POST",
              + "PUT",
            ]
          + cached_methods         = [
              + "GET",
              + "HEAD",
            ]
          + compress               = true
          + default_ttl            = 3600
          + max_ttl                = 86400
          + min_ttl                = 0
          + target_origin_id       = "myS3Origin"
          + viewer_protocol_policy = "redirect-to-https"

          + forwarded_values {
              + query_string = false

              + cookies {
                  + forward = "none"
                }
            }
        }

      + ordered_cache_behavior {
          + allowed_methods        = [
              + "DELETE",
              + "GET",
              + "HEAD",
              + "OPTIONS",
              + "PATCH",
              + "POST",
              + "PUT",
            ]
          + cached_methods         = [
              + "GET",
              + "HEAD",
            ]
          + compress               = true
          + default_ttl            = 86400
          + max_ttl                = 31536000
          + min_ttl                = 0
          + path_pattern           = "static/*"
          + target_origin_id       = "marinaconsult.co.uk-static"
          + viewer_protocol_policy = "redirect-to-https"

          + forwarded_values {
              + query_string = false

              + cookies {
                  + forward = "none"
                }
            }
        }

      + origin {
          + domain_name = (known after apply)
          + origin_id   = "marinaconsult.co.uk-static"

          + s3_origin_config {
              + origin_access_identity = (known after apply)
            }
        }
      + origin {
          + domain_name = (known after apply)
          + origin_id   = "myS3Origin"

          + s3_origin_config {
              + origin_access_identity = (known after apply)
            }
        }

      + restrictions {
          + geo_restriction {
              + restriction_type = "none"
            }
        }

      + viewer_certificate {
          + acm_certificate_arn      = (known after apply)
          + minimum_protocol_version = "TLSv1"
          + ssl_support_method       = "sni-only"
        }
    }

  # module.aws_s3_hosted_spa_infra_template.aws_cloudfront_origin_access_identity.originAccessIdentity will be created
  + resource "aws_cloudfront_origin_access_identity" "originAccessIdentity" {
      + caller_reference                = (known after apply)
      + cloudfront_access_identity_path = (known after apply)
      + comment                         = "Cloud Front Origin Access Identity"
      + etag                            = (known after apply)
      + iam_arn                         = (known after apply)
      + id                              = (known after apply)
      + s3_canonical_user_id            = (known after apply)
    }

  # module.aws_s3_hosted_spa_infra_template.aws_route53_record.domain_record will be created
  + resource "aws_route53_record" "domain_record" {
      + allow_overwrite = (known after apply)
      + fqdn            = (known after apply)
      + id              = (known after apply)
      + type            = "A"
      + zone_id         = "Z00342181VWBA8Q7KQO2Y"

      + alias {
          + evaluate_target_health = false
          + name                   = (known after apply)
          + zone_id                = (known after apply)
        }
    }

  # module.aws_s3_hosted_spa_infra_template.aws_s3_bucket.domainBucket will be created
  + resource "aws_s3_bucket" "domainBucket" {
      + acceleration_status         = (known after apply)
      + acl                         = "bucket-owner-full-control"
      + arn                         = (known after apply)
      + bucket                      = "marinaconsult.co.uk"
      + bucket_domain_name          = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags                        = {
          + "env"     = "production"
          + "project" = "marinaconsult.co.uk"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + versioning {
          + enabled    = (known after apply)
          + mfa_delete = (known after apply)
        }

      + website {
          + error_document = "index.html"
          + index_document = "index.html"
        }
    }

  # module.aws_s3_hosted_spa_infra_template.aws_s3_bucket.staticContentBucket will be created
  + resource "aws_s3_bucket" "staticContentBucket" {
      + acceleration_status         = (known after apply)
      + acl                         = "bucket-owner-full-control"
      + arn                         = (known after apply)
      + bucket                      = "marinaconsult.co.uk-static"
      + bucket_domain_name          = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags                        = {
          + "env"     = "production"
          + "project" = "marinaconsult.co.uk"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + versioning {
          + enabled    = (known after apply)
          + mfa_delete = (known after apply)
        }

      + website {
          + index_document = "index.html"
        }
    }

  # module.prepare_zone_and_certificate.aws_acm_certificate.cert will be created
  + resource "aws_acm_certificate" "cert" {
      + arn                       = (known after apply)
      + domain_name               = "marinaconsult.co.uk"
      + domain_validation_options = (known after apply)
      + id                        = (known after apply)
      + status                    = (known after apply)
      + subject_alternative_names = [
          + "www.marinaconsult.co.uk",
        ]
      + tags                      = {
          + "env"     = "production"
          + "project" = "marinaconsult.co.uk"
        }
      + validation_emails         = (known after apply)
      + validation_method         = "DNS"
    }

  # module.prepare_zone_and_certificate.aws_acm_certificate_validation.cert will be created
  + resource "aws_acm_certificate_validation" "cert" {
      + certificate_arn         = (known after apply)
      + id                      = (known after apply)
      + validation_record_fqdns = (known after apply)

      + timeouts {
          + create = "60m"
        }
    }

  # module.prepare_zone_and_certificate.aws_route53_record.cert_validation_domain will be created
  + resource "aws_route53_record" "cert_validation_domain" {
      + allow_overwrite = (known after apply)
      + fqdn            = (known after apply)
      + id              = (known after apply)
      + name            = (known after apply)
      + records         = (known after apply)
      + ttl             = 60
      + type            = (known after apply)
      + zone_id         = "Z00342181VWBA8Q7KQO2Y"
    }

  # module.prepare_zone_and_certificate.aws_route53_record.cert_validation_subdomain will be created
  + resource "aws_route53_record" "cert_validation_subdomain" {
      + allow_overwrite = (known after apply)
      + fqdn            = (known after apply)
      + id              = (known after apply)
      + name            = (known after apply)
      + records         = (known after apply)
      + ttl             = 60
      + type            = (known after apply)
      + zone_id         = "Z00342181VWBA8Q7KQO2Y"
    }

Plan: 28 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.aws_s3_hosted_spa_infra_template.aws_cloudfront_origin_access_identity.originAccessIdentity: Creating...
module.prepare_zone_and_certificate.aws_acm_certificate.cert: Creating...
module.aws_s3_hosted_spa_infra_template.aws_cloudfront_origin_access_identity.originAccessIdentity: Creation complete after 2s [id=EM52YYRKE3OMV]
module.aws_s3_hosted_spa_infra_template.aws_s3_bucket.domainBucket: Creating...
module.aws_s3_hosted_spa_infra_template.aws_s3_bucket.staticContentBucket: Creating...
module.prepare_zone_and_certificate.aws_acm_certificate.cert: Creation complete after 5s [id=arn:aws:acm:us-east-1:534714281424:certificate/4da4acb7-9dab-4ed2-8d84-1644b3d1149e]
module.prepare_zone_and_certificate.aws_route53_record.cert_validation_subdomain: Creating...
module.prepare_zone_and_certificate.aws_route53_record.cert_validation_domain: Creating...
module.aws_s3_hosted_spa_infra_template.aws_s3_bucket.domainBucket: Still creating... [10s elapsed]
module.aws_s3_hosted_spa_infra_template.aws_s3_bucket.staticContentBucket: Still creating... [10s elapsed]
module.aws_s3_hosted_spa_infra_template.aws_s3_bucket.domainBucket: Creation complete after 12s [id=marinaconsult.co.uk]
aws_s3_bucket_object.webapp["robots.txt"]: Creating...
module.aws_s3_hosted_spa_infra_template.aws_s3_bucket.staticContentBucket: Creation complete after 12s [id=marinaconsult.co.uk-static]
aws_s3_bucket_object.webapp["favicon.ico"]: Creating...
aws_s3_bucket_object.webapp["logo192.png"]: Creating...
aws_s3_bucket_object.webapp["index.html"]: Creating...
aws_s3_bucket_object.webapp["asset-manifest.json"]: Creating...
aws_s3_bucket_object.webapp["manifest.json"]: Creating...
aws_s3_bucket_object.webapp["service-worker.js"]: Creating...
aws_s3_bucket_object.webapp["precache-manifest.4a9dcd9203673a7cf782503d77102e83.js"]: Creating...
aws_s3_bucket_object.webapp["robots.txt"]: Creation complete after 0s [id=robots.txt]
aws_s3_bucket_object.webapp["logo512.png"]: Creating...
aws_s3_bucket_object.webapp["index.html"]: Creation complete after 0s [id=index.html]
aws_s3_bucket_object.webapp["logo192.png"]: Creation complete after 0s [id=logo192.png]
aws_s3_bucket_object.webapp["manifest.json"]: Creation complete after 0s [id=manifest.json]
aws_s3_bucket_object.webapp["service-worker.js"]: Creation complete after 0s [id=service-worker.js]
aws_s3_bucket_object.webapp["precache-manifest.4a9dcd9203673a7cf782503d77102e83.js"]: Creation complete after 0s [id=precache-manifest.4a9dcd9203673a7cf782503d77102e83.js]
aws_s3_bucket_object.webapp["favicon.ico"]: Creation complete after 0s [id=favicon.ico]
aws_s3_bucket_object.webapp["asset-manifest.json"]: Creation complete after 0s [id=asset-manifest.json]
aws_s3_bucket_object.webapp-static["js/2.a54d78d9.chunk.js.map"]: Creating...
aws_s3_bucket_object.webapp-static["js/2.a54d78d9.chunk.js.LICENSE.txt"]: Creating...
aws_s3_bucket_object.webapp-static["media/logo.5d5d9eef.svg"]: Creating...
aws_s3_bucket_object.webapp-static["css/main.5f361e03.chunk.css"]: Creating...
aws_s3_bucket_object.webapp-static["css/main.5f361e03.chunk.css.map"]: Creating...
aws_s3_bucket_object.webapp-static["js/main.ef632a7d.chunk.js.map"]: Creating...
aws_s3_bucket_object.webapp-static["js/runtime-main.f5bdaf34.js"]: Creating...
aws_s3_bucket_object.webapp-static["js/2.a54d78d9.chunk.js.LICENSE.txt"]: Creation complete after 1s [id=static/js/2.a54d78d9.chunk.js.LICENSE.txt]
aws_s3_bucket_object.webapp-static["css/main.5f361e03.chunk.css"]: Creation complete after 1s [id=static/css/main.5f361e03.chunk.css]
aws_s3_bucket_object.webapp["logo512.png"]: Creation complete after 1s [id=logo512.png]
aws_s3_bucket_object.webapp-static["css/main.5f361e03.chunk.css.map"]: Creation complete after 1s [id=static/css/main.5f361e03.chunk.css.map]
aws_s3_bucket_object.webapp-static["js/main.ef632a7d.chunk.js"]: Creating...
aws_s3_bucket_object.webapp-static["media/logo.5d5d9eef.svg"]: Creation complete after 1s [id=static/media/logo.5d5d9eef.svg]
aws_s3_bucket_object.webapp-static["js/2.a54d78d9.chunk.js"]: Creating...
aws_s3_bucket_object.webapp-static["js/runtime-main.f5bdaf34.js.map"]: Creating...
aws_s3_bucket_object.webapp-static["js/main.ef632a7d.chunk.js.map"]: Creation complete after 1s [id=static/js/main.ef632a7d.chunk.js.map]
aws_s3_bucket_object.webapp-static["js/runtime-main.f5bdaf34.js"]: Creation complete after 1s [id=static/js/runtime-main.f5bdaf34.js]
aws_s3_bucket_object.webapp-static["js/2.a54d78d9.chunk.js.map"]: Creation complete after 1s [id=static/js/2.a54d78d9.chunk.js.map]
aws_s3_bucket_object.webapp-static["js/runtime-main.f5bdaf34.js.map"]: Creation complete after 0s [id=static/js/runtime-main.f5bdaf34.js.map]
aws_s3_bucket_object.webapp-static["js/main.ef632a7d.chunk.js"]: Creation complete after 0s [id=static/js/main.ef632a7d.chunk.js]
aws_s3_bucket_object.webapp-static["js/2.a54d78d9.chunk.js"]: Creation complete after 0s [id=static/js/2.a54d78d9.chunk.js]
module.prepare_zone_and_certificate.aws_route53_record.cert_validation_subdomain: Still creating... [10s elapsed]
module.prepare_zone_and_certificate.aws_route53_record.cert_validation_domain: Still creating... [10s elapsed]
module.prepare_zone_and_certificate.aws_route53_record.cert_validation_subdomain: Still creating... [20s elapsed]
module.prepare_zone_and_certificate.aws_route53_record.cert_validation_domain: Still creating... [20s elapsed]
module.prepare_zone_and_certificate.aws_route53_record.cert_validation_subdomain: Still creating... [30s elapsed]
module.prepare_zone_and_certificate.aws_route53_record.cert_validation_domain: Still creating... [30s elapsed]
module.prepare_zone_and_certificate.aws_route53_record.cert_validation_subdomain: Creation complete after 38s [id=Z00342181VWBA8Q7KQO2Y__0e4da21e5286a1b4191e7cce9eac90d0.www.marinaconsult.co.uk._CNAME]
module.prepare_zone_and_certificate.aws_route53_record.cert_validation_domain: Creation complete after 38s [id=Z00342181VWBA8Q7KQO2Y__0763756131c3fd11422cccba79cd5208.marinaconsult.co.uk._CNAME]
module.prepare_zone_and_certificate.aws_acm_certificate_validation.cert: Creating...
module.prepare_zone_and_certificate.aws_acm_certificate_validation.cert: Creation complete after 2s [id=2020-07-26 13:01:24 +0000 UTC]
module.aws_s3_hosted_spa_infra_template.aws_cloudfront_distribution.s3Distribution: Creating...
module.aws_s3_hosted_spa_infra_template.aws_cloudfront_distribution.s3Distribution: Still creating... [10s elapsed]
module.aws_s3_hosted_spa_infra_template.aws_cloudfront_distribution.s3Distribution: Still creating... [20s elapsed]
module.aws_s3_hosted_spa_infra_template.aws_cloudfront_distribution.s3Distribution: Still creating... [30s elapsed]
module.aws_s3_hosted_spa_infra_template.aws_cloudfront_distribution.s3Distribution: Still creating... [40s elapsed]
module.aws_s3_hosted_spa_infra_template.aws_cloudfront_distribution.s3Distribution: Still creating... [50s elapsed]
module.aws_s3_hosted_spa_infra_template.aws_cloudfront_distribution.s3Distribution: Still creating... [1m0s elapsed]
module.aws_s3_hosted_spa_infra_template.aws_cloudfront_distribution.s3Distribution: Still creating... [1m10s elapsed]
module.aws_s3_hosted_spa_infra_template.aws_cloudfront_distribution.s3Distribution: Still creating... [1m20s elapsed]
module.aws_s3_hosted_spa_infra_template.aws_cloudfront_distribution.s3Distribution: Still creating... [1m30s elapsed]
module.aws_s3_hosted_spa_infra_template.aws_cloudfront_distribution.s3Distribution: Still creating... [1m40s elapsed]
module.aws_s3_hosted_spa_infra_template.aws_cloudfront_distribution.s3Distribution: Still creating... [1m50s elapsed]
module.aws_s3_hosted_spa_infra_template.aws_cloudfront_distribution.s3Distribution: Still creating... [2m0s elapsed]
module.aws_s3_hosted_spa_infra_template.aws_cloudfront_distribution.s3Distribution: Still creating... [2m10s elapsed]
module.aws_s3_hosted_spa_infra_template.aws_cloudfront_distribution.s3Distribution: Still creating... [2m20s elapsed]
module.aws_s3_hosted_spa_infra_template.aws_cloudfront_distribution.s3Distribution: Still creating... [2m30s elapsed]
module.aws_s3_hosted_spa_infra_template.aws_cloudfront_distribution.s3Distribution: Still creating... [2m40s elapsed]
module.aws_s3_hosted_spa_infra_template.aws_cloudfront_distribution.s3Distribution: Still creating... [2m50s elapsed]
module.aws_s3_hosted_spa_infra_template.aws_cloudfront_distribution.s3Distribution: Still creating... [3m0s elapsed]
module.aws_s3_hosted_spa_infra_template.aws_cloudfront_distribution.s3Distribution: Creation complete after 3m4s [id=E2U9AXD8GMX876]
module.aws_s3_hosted_spa_infra_template.aws_route53_record.domain_record: Creating...
module.aws_s3_hosted_spa_infra_template.aws_route53_record.domain_record: Still creating... [10s elapsed]
module.aws_s3_hosted_spa_infra_template.aws_route53_record.domain_record: Still creating... [20s elapsed]
module.aws_s3_hosted_spa_infra_template.aws_route53_record.domain_record: Still creating... [30s elapsed]
module.aws_s3_hosted_spa_infra_template.aws_route53_record.domain_record: Creation complete after 39s [id=Z00342181VWBA8Q7KQO2Y__A]

Apply complete! Resources: 28 added, 0 changed, 0 destroyed.
```