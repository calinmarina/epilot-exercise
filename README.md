Test scripts for [TF SPA infrastructure module](https://github.com/calinmarina/tf_aws_hosted_spa_infra_template_module)
====

The exercise proposed was a terraform module to build the basic infrastructure for an SPA webpage that serves the content from two AWS S3 buckets, static content being a requirement to reside in separate bucket than the rest of the app.

## Module should
- take the ARN of an ACM certificate as a parameter.
- create the necessary S3 bucket with best practices configuration.
- create route53 HostedZone.
- create CloudFront web distribution.
- create relevant DNS entries pointing to the distribution.
- IP protection implemented as desired.
- (Bonus): implement basic authentication protection for the distribution. (Can be a static username + password)

## Considerations:

This repo is a quick showcase/runner of the referenced module, best practice is to setup a CI/CD pipeline which is now omitted for time restrictions. For convenience execute.sh script was created for the following steps:

1. Check Route53 hosted zone for the indicated domain exists
2. If it doesn't exist it will be created before via aws cli. The precondition for our showcase is having a domain setup to point to our hosted zone which depends on the registrar used... there might be manual steps needed if registrar is not Route53, CloudFront or few others 
3. Create a verified ACM certificate for the domain
3. Build the SPA and produce the build folder we need for deployment in S3 buckets (see Deployment section below)
4. Deploy the infrastructure
5. Upload files in buckets
Note. the IP protection involves creation of a WAF WebACL IP rule which is included but [commented](https://github.com/calinmarina/tf_aws_hosted_spa_infra_template_module/blob/0ff156576187d7944cac158875fcba454e9eb386/main.tf#L169) and same for the [attachment to our CloudFront distribution](https://github.com/calinmarina/tf_aws_hosted_spa_infra_template_module/blob/0ff156576187d7944cac158875fcba454e9eb386/main.tf#L164) due to need for a bit of elaboration on the requirement like:
- do we want to have the IP list as an input parameter?
- do we have a certain range we, by default exclude?
- is there a Geographical restriction we want to impose? ... that will require a different configuration of CF

## Steps to achieve the installation

### 1. clone the repository
### 2. run script
```bash execute.sh <domain_name> [<region>]```

see https://marinaconsult.co.uk/ for a successful running result 

Prerequisites: 
- make sure to configure terraform provider credentials in `providers.tf`
- if your domain registrar is not AWS Route 53 you will have to change the the `Name servers` for your domain (execute.sh will print them at start) with the ones allocated by AWS to your `Hosted zone` otherwise AWS will handle this smoothly

## Log sample:
[full run log example](./run_log.md)
