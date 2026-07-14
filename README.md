# ☁️ Terraform AWS Serverless E-Commerce Platform

![Terraform](https://img.shields.io/badge/Terraform-1.x-623CE4?logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Cloud-orange?logo=amazonaws)
![Amazon ECS](https://img.shields.io/badge/Amazon-ECS-orange)
![AWS Lambda](https://img.shields.io/badge/AWS-Lambda-FF9900?logo=awslambda)
![API Gateway](https://img.shields.io/badge/API-Gateway-blue)
![DynamoDB](https://img.shields.io/badge/DynamoDB-NoSQL-blue)
![Docker](https://img.shields.io/badge/Docker-Containers-blue?logo=docker)
![License](https://img.shields.io/badge/License-MIT-green)

---

# 📖 Overview

This repository provisions the AWS infrastructure required to deploy a cloud-native serverless e-commerce platform using **Terraform**.

The infrastructure combines containerized frontend hosting with serverless backend services using reusable Terraform modules and Infrastructure as Code (IaC) best practices.

This repository focuses exclusively on the AWS infrastructure. The application source code is maintained in a separate repository.

---

# 🚧 Project Status

**Current Status:** Active Development

## Completed

- Product Catalog APIs
- Product Details API
- Product Search API
- Shopping Cart APIs
- Checkout
- Place Order API
- Amazon ECS Deployment
- AWS Lambda Integration
- Amazon API Gateway
- Amazon DynamoDB
- Modular Terraform Design

## Currently In Progress

- Order History APIs
- Order Details API
- Favorites APIs
- Address Management APIs
- Payment Method APIs
- Amazon Cognito Authentication

---

# ✨ Current Features

- Product Catalog
- Product Details
- Product Search
- Shopping Cart
- Update Cart Quantity
- Remove Cart Items
- Checkout
- Place Order
- REST APIs using API Gateway
- AWS Lambda Serverless Backend
- Amazon DynamoDB Integration
- Infrastructure as Code using Terraform
- Dockerized Frontend Deployment
- ECS Fargate Hosting

---

# 🏗 Architecture

```text
                    Internet
                        │
                        ▼
         Application Load Balancer
                        │
                        ▼
              Amazon ECS Fargate
                        │
                        ▼
              Next.js Frontend
                        │
                        ▼
              Amazon API Gateway
                        │
        ┌───────────────┼────────────────┐
        ▼               ▼                ▼
 Product APIs      Shopping Cart      Order APIs
        │               │                │
        └───────────────┼────────────────┘
                        ▼
                  AWS Lambda
                        │
                        ▼
               Amazon DynamoDB
```

---

# 🚀 AWS Services Provisioned

- Amazon VPC
- Public Subnets
- Internet Gateway
- Route Tables
- Security Groups
- Application Load Balancer
- Amazon ECS Cluster
- AWS Fargate
- Amazon ECR
- Amazon API Gateway
- AWS Lambda
- Amazon DynamoDB
- CloudWatch Logs
- IAM Roles & Policies
- Route53 (Optional)

---

# 📁 Repository Structure

```text
terraform-aws-serverless-ecommerce-platform

├── lambda/
│   ├── cart/
│   ├── orders/
│   └── products/
│
├── modules/
│   ├── alb/
│   ├── apigateway/
│   ├── dynamodb/
│   ├── ecs/
│   ├── lambda/
│   ├── route53/
│   └── vpc/
│
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars.example
└── README.md
```

---

# 📦 Terraform Modules

## VPC

Creates:

- VPC
- Public Subnets
- Internet Gateway
- Route Tables

---

## Application Load Balancer

Creates:

- Application Load Balancer
- Target Groups
- Listeners
- Security Groups

---

## ECS

Creates:

- ECS Cluster
- ECS Service
- ECS Task Definition
- CloudWatch Log Group
- IAM Execution Role

Deploys the containerized Next.js frontend using AWS Fargate.

---

## Lambda

Deploys serverless Lambda functions for:

- Product Catalog
- Product Details
- Product Search
- Shopping Cart
- Update Cart
- Delete Cart
- Place Order

---

## API Gateway

Creates REST APIs for the application.

| Method | Endpoint | Description |
|---------|----------|-------------|
| GET | /products | Get all products |
| GET | /products/{id} | Get product details |
| GET | /products/search | Search products |
| GET | /cart | Retrieve shopping cart |
| POST | /cart | Add product to cart |
| PUT | /cart | Update cart quantity |
| DELETE | /cart | Remove cart item |
| POST | /orders | Place customer order |

---

## DynamoDB

Creates NoSQL tables:

- vlr-products
- vlr-cart
- vlr-orders

---

## Route53

Creates DNS records pointing to the Application Load Balancer.

(Optional)

---

# 🚀 Deployment

## Initialize

```bash
terraform init
```

## Validate

```bash
terraform validate
```

## Review Infrastructure

```bash
terraform plan
```

## Deploy

```bash
terraform apply
```

## Destroy

```bash
terraform destroy
```

---

# 📋 Prerequisites

- Terraform 1.x
- AWS CLI
- AWS Account
- Docker Desktop
- Amazon ECR Repository
- Configured AWS Credentials

---

# 📊 Skills Demonstrated

- Terraform
- Infrastructure as Code
- AWS Networking
- Amazon ECS
- AWS Fargate
- Amazon API Gateway
- AWS Lambda
- Amazon DynamoDB
- IAM
- CloudWatch
- Docker
- Modular Terraform Design
- REST API Infrastructure
- Serverless Architecture

---

# 🌟 Portfolio Highlights

This project demonstrates:

- Modular Terraform architecture
- AWS serverless application design
- Infrastructure as Code best practices
- Docker container deployment
- REST API infrastructure
- Event-driven AWS Lambda functions
- Amazon DynamoDB integration
- Amazon ECS Fargate deployment
- Production-style cloud architecture

---

# 🔄 Future Enhancements

Planned improvements include:

- Amazon Cognito Authentication
- Role-Based Authorization
- Favorites APIs
- Address Management APIs
- Payment Method APIs
- Order History APIs
- Order Details APIs
- CloudFront CDN
- AWS WAF
- HTTPS using ACM
- GitHub Actions CI/CD
- Blue/Green Deployment
- Terraform Remote State
- Least-Privilege IAM Policies
- CloudWatch Dashboards
- AWS X-Ray Tracing

---

# 🔗 Related Repositories

## vinod-luxury-retail-local

Local prototype built using JSON files without cloud services.

---

## vinod-luxury-retail-serverless

Contains:

- Next.js Frontend
- AWS Lambda Source Code
- DynamoDB Import Scripts
- Serverless Application Logic

---

# ⚠️ Disclaimer

This repository was created for educational, learning, and portfolio purposes.

The infrastructure provisions AWS resources to support a sample luxury retail e-commerce application.

All sample data, products, brands, customers, addresses, payment methods, and orders are **fictional** and intended solely for demonstrating cloud architecture, Infrastructure as Code, and serverless application development.

No proprietary business information, customer data, trademarks, or confidential assets are included.

---

# 👨‍💻 Author

**Vinod Beriki**

DevOps Engineer | AWS | Terraform | Kubernetes | Docker | Serverless

GitHub

https://github.com/berikivinod

---

# 📄 License

MIT License