data "aws_caller_identity" "current" {}

module "vpc" {
  source = "./modules/vpc"

  cidr_block = "10.0.0.0/16"
  name       = "ecs-fargate-vpc"
}

module "alb" {

  source = "./modules/alb"

  name = "ecs-demo"

  vpc_id = module.vpc.vpc_id

  public_subnets = module.vpc.public_subnets
}
/*
resource "aws_ecr_repository" "app" {
  name = var.app_name

  image_scanning_configuration {
    scan_on_push = true
  }

  image_tag_mutability = "MUTABLE"
}
*/


module "ecs" {

  source = "./modules/ecs"

  name = "ecs-demo"

  vpc_id = module.vpc.vpc_id

  private_subnets = module.vpc.public_subnets

  target_group_arn      = module.alb.target_group_arn
  ecr_repository_url    = "713716300558.dkr.ecr.us-east-2.amazonaws.com/vlr-ui"
  alb_security_group_id = module.alb.alb_security_group_id
}
/*
module "route53" {

  source = "./modules/route53"

  hosted_zone_id = var.hosted_zone_id

  record_name = var.record_name

  alb_dns_name = module.alb.alb_dns_name

  alb_zone_id = module.alb.alb_zone_id
}
*/

module "products_table" {

  source = "./modules/dynamodb"

  table_name    = "vlr-products"
  hash_key      = "id"
  hash_key_type = "N"
}

module "cart_table" {

  source = "./modules/dynamodb"

  table_name = "vlr-cart"

  hash_key      = "userId"
  hash_key_type = "S"
}
/*
module "favorites_table" {

  source = "./modules/dynamodb"

  table_name = "vlr-favorites"

  hash_key = "userId"

  hash_key_type = "S"
}

module "orders_table" {

  source = "./modules/dynamodb"

  table_name = "vlr-orders"

  hash_key = "orderId"

  hash_key_type = "S"
}



module "users_table" {

  source = "./modules/dynamodb"

  table_name = "vlr-users"

  hash_key = "userId"

  hash_key_type = "S"
}
*/

module "orders_table" {

  source = "./modules/dynamodb"

  table_name = "vlr-orders"

  hash_key = "orderId"

  hash_key_type = "S"

  global_secondary_indexes = [

    {

      name = "userId-index"

      hash_key = "userId"

      hash_key_type = "S"

      projection_type = "ALL"

    }

  ]

}

module "get_orders_lambda" {

  source = "./modules/lambda"

  function_name = "vlr-get-orders"

  filename = "${path.root}/lambda/orders/get-orders/get-orders.zip"

  handler = "index.handler"

  runtime = "nodejs20.x"

}

module "get_order_by_id_lambda" {

  source = "./modules/lambda"

  function_name = "vlr-get-order-by-id"

  filename = "${path.root}/lambda/orders/get-order-by-id/get-order-by-id.zip"

  handler = "index.handler"

  runtime = "nodejs20.x"

}

module "products_lambda" {

  source = "./modules/lambda"

  function_name = "vlr-get-products"

  filename = "${path.root}/lambda/products/get-products/get-products.zip"

  handler = "index.handler"

  runtime = "nodejs20.x"
}

module "product_by_id_lambda" {

  source = "./modules/lambda"

  function_name = "vlr-get-product-by-id"

  filename = "${path.root}/lambda/products/get-product-by-id/get-product-by-id.zip"

  handler = "index.handler"

  runtime = "nodejs20.x"
}

/*module "products_api" {

  source = "./modules/apigateway"

  api_name = "vlr-products-api"

  lambda_invoke_arn = module.products_lambda.lambda_invoke_arn

  lambda_function_name = module.products_lambda.function_name
}*/

module "search_products_lambda" {

  source = "./modules/lambda"

  function_name = "vlr-search-products"

  filename = "${path.root}/lambda/products/search-products/search-products.zip"

  handler = "index.handler"

  runtime = "nodejs20.x"
}

module "add_to_cart_lambda" {

  source = "./modules/lambda"

  function_name = "vlr-add-to-cart"

  filename = "${path.root}/lambda/cart/add-to-cart/add-to-cart.zip"

  handler = "index.handler"

  runtime = "nodejs20.x"
}

module "get_cart_lambda" {

  source = "./modules/lambda"

  function_name = "vlr-get-cart"

  filename = "${path.root}/lambda/cart/get-cart/get-cart.zip"

  handler = "index.handler"

  runtime = "nodejs20.x"
}

module "update_cart_lambda" {

  source = "./modules/lambda"

  function_name = "vlr-update-cart"

  filename = "${path.root}/lambda/cart/update-cart/update-cart.zip"

  handler = "index.handler"

  runtime = "nodejs20.x"

}

module "delete_cart_lambda" {

  source = "./modules/lambda"

  function_name = "vlr-delete-cart"

  filename = "${path.root}/lambda/cart/delete-cart/delete-cart.zip"

  handler = "index.handler"

  runtime = "nodejs20.x"

}

module "place_order_lambda" {

  source = "./modules/lambda"

  function_name = "vlr-place-order"

  filename = "${path.root}/lambda/orders/place-order/place-order.zip"

  handler = "index.handler"

  runtime = "nodejs20.x"

}

module "products_api" {

  source = "./modules/apigateway"

  api_name = "vlr-products-api"

  lambda_invoke_arn                    = module.products_lambda.lambda_invoke_arn
  lambda_function_name                 = module.products_lambda.function_name
  product_by_id_lambda_invoke_arn      = module.product_by_id_lambda.lambda_invoke_arn
  product_by_id_lambda_function_name   = module.product_by_id_lambda.function_name
  search_lambda_invoke_arn             = module.search_products_lambda.lambda_invoke_arn
  search_lambda_function_name          = module.search_products_lambda.function_name
  add_to_cart_lambda_invoke_arn        = module.add_to_cart_lambda.lambda_invoke_arn
  add_to_cart_lambda_function_name     = module.add_to_cart_lambda.function_name
  get_cart_lambda_invoke_arn           = module.get_cart_lambda.lambda_invoke_arn
  get_cart_lambda_function_name        = module.get_cart_lambda.function_name
  update_cart_lambda_invoke_arn        = module.update_cart_lambda.lambda_invoke_arn
  update_cart_lambda_function_name     = module.update_cart_lambda.function_name
  delete_cart_lambda_invoke_arn        = module.delete_cart_lambda.lambda_invoke_arn
  delete_cart_lambda_function_name     = module.delete_cart_lambda.function_name
  place_order_lambda_invoke_arn        = module.place_order_lambda.lambda_invoke_arn
  place_order_lambda_function_name     = module.place_order_lambda.function_name
  get_orders_lambda_invoke_arn         = module.get_orders_lambda.lambda_invoke_arn
  get_orders_lambda_function_name      = module.get_orders_lambda.function_name
  get_order_by_id_lambda_invoke_arn    = module.get_order_by_id_lambda.lambda_invoke_arn
  get_order_by_id_lambda_function_name = module.get_order_by_id_lambda.function_name
}

