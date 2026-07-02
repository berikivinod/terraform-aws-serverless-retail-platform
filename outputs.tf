output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "private_subnets" {
  value = module.vpc.private_subnets
}
/*
output "application_url" {
  value = module.route53.record_fqdn
}
*/