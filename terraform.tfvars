#Account
region                 =  "eu-west-1"

#EC2
name                   =  "ILITIA_API_ieev2"
group_id               =  ["sg-0d16af15862d229e7"]
ami                    =  "ami-0913ad7ef082d3d2b"
instance_type          =  "t3a.small"
ssh_key                =  "devilitia"
subnet_ids             =  ["subnet-04477300c78605cb3","subnet-0e0c8cf77e80371fa","subnet-01a2a36ae4a10d531"]

#S3
frontend_s3            =  "ieev2.ilitiasolution.com"
backend_s3             =  "ieev2-ilitia-data"
resource_frontend_s3   =  "arn:aws:s3:::ieev2.ilitiasolution.com/*"
referer_backend_s3     =  ["http://ieev2.ilitiasolution.com/*","https://ieev2.ilitiasolution.com/*","http://ieev2-api.ilitiasolution.com/*","http://ieev2-api.ilitiasolution.com:39444/*","https://ieev2-api.ilitiasolution.com:39444/*","http://ieev2.ilitiasolution.com.s3-website-eu-west-1.amazonaws.com/*"]
resource_backend_s3    =  "arn:aws:s3:::ieev2-ilitia-data/*"
origin_domain          =  "ieev2.ilitiasolution.com.s3.eu-west-1.amazonaws.com"

#CloudFront
comment_cloudfront     =  "ILITIA_PROD_ieev2"
cname                  =  ["ieev2.ilitiasolution.com"]
ilitia_cache           =  "62144c75-8df5-4e93-a7af-0ae67d800c4f"

#Route53
ilitia                 =  "ilitiasolution.com"
api_name               =  "ieev2-api"
front_name             =  "ieev2"

#Cert
ilitia_domain          = "*.ilitiasolution.com"