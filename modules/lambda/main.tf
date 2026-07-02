resource "aws_iam_role" "lambda_role" {

  name = "${var.function_name}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"

      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "basic" {

  role       = aws_iam_role.lambda_role.name

  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy" "dynamodb_access" {

  name = "${var.function_name}-ddb"

  role = aws_iam_role.lambda_role.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "dynamodb:Scan",
          "dynamodb:GetItem",
          "dynamodb:Query",
          "dynamodb:PutItem"
        ]

        Resource = "*"
      }
    ]
  })
}

resource "aws_lambda_function" "this" {

  function_name = var.function_name

  filename         = var.filename
  source_code_hash = filebase64sha256(var.filename)

  role    = aws_iam_role.lambda_role.arn
  handler = var.handler
  runtime = var.runtime
}