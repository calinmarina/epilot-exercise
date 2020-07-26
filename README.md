... updating for new running procedure ... pending PR testing

```bash execute.sh <domain_name> [<region>]```

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

This repo is a quick showcase/runner of the referenced module, best practice would be to setup a CI/CD pipeline directly in the module repo which is why this will soon become useless as all steps in that pipeline would be:
1. Create Route53 hosted zone for test domain
2. Create a verified ACM certificate for the test domain
3. Spin up a docker container to build the SPA and produce the build folder we need for deployment in S3 buckets (see Deployment section below)
4. Having the preconditinos for out module ready we can call our TF module to create de infrastructure which consists of creating an configuring the S3 buckets accessible via OAI by the CloudFront distribution only.
Note. the IP protection involves creation of a WAF WebACL IP rule which is included but [commented](https://github.com/calinmarina/tf_aws_hosted_spa_infra_template_module/blob/0ff156576187d7944cac158875fcba454e9eb386/main.tf#L169) and same for the [attachment to our CloudFront distribution](https://github.com/calinmarina/tf_aws_hosted_spa_infra_template_module/blob/0ff156576187d7944cac158875fcba454e9eb386/main.tf#L164) due to need for a bit of elaboration on the requirement like:
- do we want to have the IP list as an input parameter?
- do we have a certain range we, by default exclude?
- is there a Geographical restriction we want to impose? ... that will require a different configuration of CF

## Steps to achieve the installation
see https://calinmarina.ml/ for a successful running result 

### 1. Prepare SPA deployment files

run `npm run build` builds the app for production to the `build` folder.<br />

The SPA project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app) and there is no other modification to it as of now. 
This correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.<br />
Your app is ready to be deployed!

### 2. Run terraform scripts

`terraform apply`

This will create:
- Rote 53 hosted zone
- create certificate in ACM and verify it
- invoke the module under test ([see module usage](https://github.com/calinmarina/tf_aws_hosted_spa_infra_template_module))
- upload build directory into the two S3 buckets

*Notes.* 
- First run might timeout because ACM certificate validation takes a bit longer. Just run `terraform apply` angain after the certificate in ACM shows a green Issued state
- make sure to configure terraform provider credentials in `providers.tf`
- if your domain registrar is not AWS Route 53 you will have to change the the `Name servers` for your domain with the ones allocated by AWS to your `Hosted zone` otherwise AWS will handle this smoothly
