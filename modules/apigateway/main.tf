resource "aws_api_gateway_rest_api" "this" {
  name = var.api_name
}

resource "aws_api_gateway_resource" "products" {

  rest_api_id = aws_api_gateway_rest_api.this.id

  parent_id = aws_api_gateway_rest_api.this.root_resource_id

  path_part = "products"
}

resource "aws_api_gateway_resource" "product_id" {

  rest_api_id = aws_api_gateway_rest_api.this.id

  parent_id = aws_api_gateway_resource.products.id

  path_part = "{id}"
}

resource "aws_api_gateway_resource" "search" {

  rest_api_id =aws_api_gateway_rest_api.this.id

  parent_id =aws_api_gateway_resource.products.id

  path_part = "search"
}

resource "aws_api_gateway_resource" "cart" {

  rest_api_id = aws_api_gateway_rest_api.this.id

  parent_id = aws_api_gateway_rest_api.this.root_resource_id

  path_part = "cart"
}

resource "aws_api_gateway_method" "get_products" {

  rest_api_id = aws_api_gateway_rest_api.this.id

  resource_id = aws_api_gateway_resource.products.id

  http_method = "GET"

  authorization = "NONE"
}

resource "aws_api_gateway_method" "get_product_by_id" {

  rest_api_id = aws_api_gateway_rest_api.this.id

  resource_id = aws_api_gateway_resource.product_id.id

  http_method = "GET"

  authorization = "NONE"
}

resource "aws_api_gateway_method" "search_products" {

  rest_api_id =aws_api_gateway_rest_api.this.id

  resource_id =aws_api_gateway_resource.search.id

  http_method = "GET"

  authorization = "NONE"
}

resource "aws_api_gateway_method" "add_to_cart" {

  rest_api_id = aws_api_gateway_rest_api.this.id

  resource_id = aws_api_gateway_resource.cart.id

  http_method = "POST"

  authorization = "NONE"
}

resource "aws_api_gateway_method" "get_cart" {

  rest_api_id = aws_api_gateway_rest_api.this.id

  resource_id = aws_api_gateway_resource.cart.id

  http_method = "GET"

  authorization = "NONE"
}

resource "aws_api_gateway_method" "update_cart" {

  rest_api_id = aws_api_gateway_rest_api.this.id

  resource_id = aws_api_gateway_resource.cart.id

  http_method = "PUT"

  authorization = "NONE"
}

resource "aws_api_gateway_method" "cart_options" {

  rest_api_id = aws_api_gateway_rest_api.this.id

  resource_id = aws_api_gateway_resource.cart.id

  http_method = "OPTIONS"

  authorization = "NONE"
}

resource "aws_api_gateway_method" "delete_cart" {

  rest_api_id = aws_api_gateway_rest_api.this.id

  resource_id = aws_api_gateway_resource.cart.id

  http_method = "DELETE"

  authorization = "NONE"

}

resource "aws_api_gateway_integration" "products" {

  rest_api_id = aws_api_gateway_rest_api.this.id

  resource_id = aws_api_gateway_resource.products.id

  http_method = aws_api_gateway_method.get_products.http_method

  integration_http_method = "POST"

  type = "AWS_PROXY"

  uri = var.lambda_invoke_arn
}

resource "aws_api_gateway_integration" "product_by_id" {

  rest_api_id = aws_api_gateway_rest_api.this.id

  resource_id = aws_api_gateway_resource.product_id.id

  http_method = aws_api_gateway_method.get_product_by_id.http_method

  integration_http_method = "POST"

  type = "AWS_PROXY"

  uri = var.product_by_id_lambda_invoke_arn
}

resource "aws_api_gateway_integration" "search_products" {

  rest_api_id =aws_api_gateway_rest_api.this.id

  resource_id =aws_api_gateway_resource.search.id

  http_method =aws_api_gateway_method.search_products.http_method

  integration_http_method = "POST"

  type = "AWS_PROXY"

  uri = var.search_lambda_invoke_arn
}

resource "aws_api_gateway_integration" "add_to_cart" {

  rest_api_id = aws_api_gateway_rest_api.this.id

  resource_id = aws_api_gateway_resource.cart.id

  http_method = aws_api_gateway_method.add_to_cart.http_method

  integration_http_method = "POST"

  type = "AWS_PROXY"

  uri = var.add_to_cart_lambda_invoke_arn
}

resource "aws_api_gateway_integration" "get_cart" {

  rest_api_id = aws_api_gateway_rest_api.this.id

  resource_id = aws_api_gateway_resource.cart.id

  http_method = aws_api_gateway_method.get_cart.http_method

  integration_http_method = "POST"

  type = "AWS_PROXY"

  uri = var.get_cart_lambda_invoke_arn
}

resource "aws_api_gateway_integration" "update_cart" {

  rest_api_id = aws_api_gateway_rest_api.this.id

  resource_id = aws_api_gateway_resource.cart.id

  http_method = aws_api_gateway_method.update_cart.http_method

  integration_http_method = "POST"

  type = "AWS_PROXY"

  uri = var.update_cart_lambda_invoke_arn
}

resource "aws_api_gateway_integration" "cart_options" {

  rest_api_id = aws_api_gateway_rest_api.this.id

  resource_id = aws_api_gateway_resource.cart.id

  http_method = aws_api_gateway_method.cart_options.http_method

  type = "MOCK"

  request_templates = {
    "application/json" = "{\"statusCode\": 200}"
  }
}

resource "aws_api_gateway_integration" "delete_cart" {

  rest_api_id = aws_api_gateway_rest_api.this.id

  resource_id = aws_api_gateway_resource.cart.id

  http_method = aws_api_gateway_method.delete_cart.http_method

  integration_http_method = "POST"

  type = "AWS_PROXY"

  uri = var.delete_cart_lambda_invoke_arn

}

resource "aws_api_gateway_method_response" "cart_options" {

  rest_api_id = aws_api_gateway_rest_api.this.id

  resource_id = aws_api_gateway_resource.cart.id

  http_method = aws_api_gateway_method.cart_options.http_method

  status_code = "200"

  response_models = {
    "application/json" = "Empty"
  }

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin"  = true
    "method.response.header.Access-Control-Allow-Headers" = true
    "method.response.header.Access-Control-Allow-Methods" = true
  }
}

resource "aws_api_gateway_integration_response" "cart_options" {

  rest_api_id = aws_api_gateway_rest_api.this.id

  resource_id = aws_api_gateway_resource.cart.id

  http_method = aws_api_gateway_method.cart_options.http_method

  status_code = aws_api_gateway_method_response.cart_options.status_code

  response_parameters = {
  "method.response.header.Access-Control-Allow-Origin"  = "'*'"
  "method.response.header.Access-Control-Allow-Headers" = "'Content-Type,Authorization,X-Amz-Date,X-Api-Key,X-Amz-Security-Token'"
  "method.response.header.Access-Control-Allow-Methods" = "'GET,POST,PUT,DELETE,OPTIONS'"
}
}

resource "aws_lambda_permission" "api_gateway" {

  statement_id = "AllowAPIGatewayInvoke"

  action = "lambda:InvokeFunction"

  function_name = var.lambda_function_name

  principal = "apigateway.amazonaws.com"
  source_arn = "${aws_api_gateway_rest_api.this.execution_arn}/*/*"
}

resource "aws_lambda_permission" "api_gateway_product_by_id" {

  statement_id = "AllowAPIGatewayInvokeProductById"

  action = "lambda:InvokeFunction"

  function_name = var.product_by_id_lambda_function_name

  principal = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.this.execution_arn}/*/*"
}

resource "aws_lambda_permission" "search_products" {

  statement_id = "AllowAPIGatewayInvokeSearch"

  action = "lambda:InvokeFunction"

  function_name =var.search_lambda_function_name

  principal ="apigateway.amazonaws.com"
  source_arn = "${aws_api_gateway_rest_api.this.execution_arn}/*/*"
}

resource "aws_lambda_permission" "add_to_cart" {

  statement_id = "AllowAPIGatewayInvokeAddToCart"

  action = "lambda:InvokeFunction"

  function_name = var.add_to_cart_lambda_function_name

  principal = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.this.execution_arn}/*/*"
}

resource "aws_lambda_permission" "get_cart" {

  statement_id = "AllowAPIGatewayInvokeGetCart"

  action = "lambda:InvokeFunction"

  function_name = var.get_cart_lambda_function_name

  principal = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.this.execution_arn}/*/*"
}

resource "aws_lambda_permission" "update_cart" {

  statement_id = "AllowAPIGatewayInvokeUpdateCart"

  action = "lambda:InvokeFunction"

  function_name = var.update_cart_lambda_function_name

  principal = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.this.execution_arn}/*/*"
}

resource "aws_lambda_permission" "delete_cart" {

  statement_id = "AllowAPIGatewayInvokeDeleteCart"

  action = "lambda:InvokeFunction"

  function_name = var.delete_cart_lambda_function_name

  principal = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.this.execution_arn}/*/*"

}

resource "aws_api_gateway_resource" "orders" {

  rest_api_id = aws_api_gateway_rest_api.this.id

  parent_id = aws_api_gateway_rest_api.this.root_resource_id

  path_part = "orders"

}

resource "aws_api_gateway_method" "place_order" {

  rest_api_id = aws_api_gateway_rest_api.this.id

  resource_id = aws_api_gateway_resource.orders.id

  http_method = "POST"

  authorization = "NONE"

}

resource "aws_api_gateway_method" "orders_options" {

  rest_api_id = aws_api_gateway_rest_api.this.id

  resource_id = aws_api_gateway_resource.orders.id

  http_method = "OPTIONS"

  authorization = "NONE"

}

resource "aws_api_gateway_integration" "place_order" {

  rest_api_id = aws_api_gateway_rest_api.this.id

  resource_id = aws_api_gateway_resource.orders.id

  http_method = aws_api_gateway_method.place_order.http_method

  integration_http_method = "POST"

  type = "AWS_PROXY"

  uri = var.place_order_lambda_invoke_arn

}

resource "aws_api_gateway_integration" "orders_options" {

  rest_api_id = aws_api_gateway_rest_api.this.id

  resource_id = aws_api_gateway_resource.orders.id

  http_method = aws_api_gateway_method.orders_options.http_method

  type = "MOCK"

  request_templates = {
    "application/json" = "{\"statusCode\": 200}"
  }

}

resource "aws_lambda_permission" "place_order" {

  statement_id = "AllowAPIGatewayInvokePlaceOrder"

  action = "lambda:InvokeFunction"

  function_name = var.place_order_lambda_function_name

  principal = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.this.execution_arn}/*/*"

}

resource "aws_api_gateway_method_response" "orders_options" {

  rest_api_id = aws_api_gateway_rest_api.this.id

  resource_id = aws_api_gateway_resource.orders.id

  http_method = aws_api_gateway_method.orders_options.http_method

  status_code = "200"

  response_models = {
    "application/json" = "Empty"
  }

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin"  = true
    "method.response.header.Access-Control-Allow-Headers" = true
    "method.response.header.Access-Control-Allow-Methods" = true
  }

}

resource "aws_api_gateway_integration_response" "orders_options" {

  rest_api_id = aws_api_gateway_rest_api.this.id

  resource_id = aws_api_gateway_resource.orders.id

  http_method = aws_api_gateway_method.orders_options.http_method

  status_code = aws_api_gateway_method_response.orders_options.status_code

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin"  = "'*'"
    "method.response.header.Access-Control-Allow-Headers" = "'Content-Type,Authorization,X-Amz-Date,X-Api-Key,X-Amz-Security-Token'"
    "method.response.header.Access-Control-Allow-Methods" = "'GET,POST,PUT,DELETE,OPTIONS'"
  }

}


resource "aws_api_gateway_deployment" "this" {

  depends_on = [
    aws_api_gateway_integration.products,
    aws_api_gateway_integration.product_by_id,
    aws_api_gateway_integration.search_products,
    aws_api_gateway_integration.add_to_cart,
    aws_api_gateway_integration.get_cart,
    aws_api_gateway_integration.update_cart,
    aws_api_gateway_integration.cart_options,
    aws_api_gateway_integration.delete_cart,
    aws_api_gateway_integration.place_order,
    aws_api_gateway_integration.orders_options
  ]

  rest_api_id = aws_api_gateway_rest_api.this.id

  triggers = {
    redeployment = sha1(jsonencode([
      aws_api_gateway_resource.products.id,
      aws_api_gateway_resource.product_id.id,
      aws_api_gateway_resource.search.id,
      aws_api_gateway_resource.cart.id,
      aws_api_gateway_method.get_products.id,
      aws_api_gateway_method.get_product_by_id.id,
      aws_api_gateway_method.search_products.id,
      aws_api_gateway_method.add_to_cart.id,
      aws_api_gateway_method.get_cart.id,
      aws_api_gateway_method.update_cart.id,
      aws_api_gateway_method.cart_options.id,
      aws_api_gateway_method.delete_cart.id,
      aws_api_gateway_resource.orders.id,
      aws_api_gateway_method.place_order.id,
      aws_api_gateway_method.orders_options.id,
    ]))
  }

  lifecycle {
    create_before_destroy = true
  }
}




resource "aws_api_gateway_stage" "dev" {

  deployment_id = aws_api_gateway_deployment.this.id

  rest_api_id = aws_api_gateway_rest_api.this.id

  stage_name = "dev"
}