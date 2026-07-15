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

This repository provisions the complete AWS infrastructure required to deploy a cloud-native luxury retail e-commerce platform using **Terraform**.

The infrastructure combines a containerized frontend hosted on **Amazon ECS Fargate** with a scalable **AWS Serverless backend** powered by **Amazon API Gateway**, **AWS Lambda**, and **Amazon DynamoDB**.

The project demonstrates Infrastructure as Code (IaC) best practices using reusable Terraform modules, modular architecture, and production-inspired AWS design patterns.

This repository focuses exclusively on infrastructure provisioning. The application source code is maintained in a separate repository.

---

# 🚧 Project Status

**Current Status:** Active Development

## ✅ Completed

- Product Catalog APIs
- Product Details API
- Product Search API
- Shopping Cart APIs
- Checkout Infrastructure
- Place Order API
- Get Orders API
- Get Order By ID API
- Amazon ECS Deployment
- AWS Lambda Integration
- Amazon API Gateway
- Amazon DynamoDB
- Docker Deployment
- Modular Terraform Architecture

## 🚧 Currently In Progress

- Favorites Infrastructure
- Address Management APIs
- Payment Method APIs
- Amazon Cognito Authentication
- CloudFront Integration
- CI/CD Automation

---

# ✨ Current Features

- Product Catalog
- Product Details
- Product Search
- Shopping Cart
- Update Cart Quantity
- Remove Cart Items
- Checkout
- Order APIs
- REST APIs using Amazon API Gateway
- AWS Lambda Serverless Backend
- Amazon DynamoDB Integration
- Infrastructure as Code using Terraform
- Dockerized Frontend Deployment
- Amazon ECS Fargate Hosting

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

### Product APIs

- Get Products
- Get Product By ID
- Search Products

### Shopping Cart APIs

- Get Cart
- Add To Cart
- Update Cart
- Delete Cart

### Order APIs

- Place Order
- Get Orders
- Get Order By ID

---

## API Gateway

Creates REST APIs.

| Method | Endpoint | Description |
|---------|----------|-------------|
| GET | /products | Retrieve all products |
| GET | /products/{id} | Retrieve product details |
| GET | /products/search | Search products |
| GET | /cart | Retrieve shopping cart |
| POST | /cart | Add product to cart |
| PUT | /cart | Update cart quantity |
| DELETE | /cart | Remove cart item |
| POST | /orders | Place customer order |
| GET | /orders | Retrieve customer orders |
| GET | /orders/{orderId} | Retrieve order details |

---

## DynamoDB

Creates:

- vlr-products
- vlr-cart
- vlr-orders

The Orders table includes a **Global Secondary Index (userId-index)** to efficiently retrieve customer orders.

---

## Route53

Creates DNS records pointing to the Application Load Balancer.

*(Optional)*

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
- REST API Infrastructure
- Serverless Architecture
- Modular Terraform Design

---

# 🌟 Portfolio Highlights

This project demonstrates:

- Modular Terraform architecture
- Infrastructure as Code best practices
- Cloud-native AWS architecture
- Hybrid container and serverless deployment
- Amazon ECS Fargate deployment
- AWS Lambda REST APIs
- Amazon API Gateway
- Amazon DynamoDB integration
- Docker container deployment
- Production-style cloud infrastructure

---

# 🔄 Future Enhancements

Planned improvements include:

- Amazon Cognito Authentication
- Favorites Infrastructure
- Address Management APIs
- Payment Method APIs
- CloudFront CDN
- AWS WAF
- HTTPS using ACM
- GitHub Actions CI/CD
- Blue/Green Deployments
- Terraform Remote State
- Least-Privilege IAM Policies
- CloudWatch Dashboards
- AWS X-Ray Tracing
- DynamoDB module modernization
- API Gateway module refactoring

---

# 🔗 Related Repositories

## vinod-luxury-retail-serverless

Contains:

- Next.js Frontend
- AWS Lambda Source Code
- DynamoDB Seed Scripts
- Docker Configuration
- Serverless Application Logic

---

## vinod-luxury-retail-local

Local prototype built using JSON files without cloud services.

---

# ⚠️ Disclaimer

This repository was created solely for educational, learning, and portfolio purposes.

The infrastructure provisions AWS resources supporting a fictional luxury retail e-commerce platform.

All products, brands, customers, addresses, payment methods, shopping carts, favorites, and orders are **fictional sample data** created exclusively for learning and demonstration purposes.

This repository contains no proprietary business information, customer data, trademarks, or confidential assets.

---

# 👨‍💻 Author

**Vinod Beriki**

DevOps Engineer | AWS | Terraform | Kubernetes | Docker | Serverless

GitHub

https://github.com/berikivinod

---

# 📄 License

MIT License