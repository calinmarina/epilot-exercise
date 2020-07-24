provider "aws" {
  region                  = var.region
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "marinaconsult"
}

provider "aws" {
  # The ACM Certificate will have to be in US-EAST-1
  # see: https://www.terraform.io/docs/providers/aws/r/cloudfront_distribution.html#acm_certificate_arn
  region = "us-east-1"
  alias  = "acm_certificate_must_be_in_virginia"
}
