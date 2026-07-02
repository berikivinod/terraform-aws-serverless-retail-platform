output "api_url" {

  value = "https://${aws_api_gateway_rest_api.this.id}.execute-api.us-east-2.amazonaws.com/${aws_api_gateway_stage.dev.stage_name}/products"
}