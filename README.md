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

This repository provisions the complete AWS infrastructure required to deploy the **Vinod Luxury Retail (VLR)** cloud-native e-commerce platform using **Terraform**.

The infrastructure combines a containerized frontend running on **Amazon ECS Fargate** with a scalable serverless backend powered by **Amazon API Gateway**, **AWS Lambda**, and **Amazon DynamoDB**.

The project demonstrates Infrastructure as Code (IaC) best practices using reusable Terraform modules, modular architecture, least-privilege IAM policies, and production-inspired AWS design patterns.

This repository provisions infrastructure only. The application source code, frontend, Lambda business logic, and UI are maintained in the companion application repository.

---

# 🎯 Project Objectives

This project demonstrates how to build a production-style cloud-native retail platform using modern AWS services.

Key objectives include:

- Infrastructure as Code using Terraform
- Modular Terraform architecture
- Containerized frontend deployment
- Serverless backend architecture
- REST API infrastructure
- Amazon DynamoDB data modeling
- Secure IAM design
- Production-style AWS networking
- Cloud-native application deployment

---

# 🚧 Project Status

**Current Status:** Active Development

## ✅ Completed

### Infrastructure

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
- Docker Deployment
- Modular Terraform Architecture

### Serverless APIs

- Product Catalog API
- Product Details API
- Product Search API
- Place Order API
- Get Orders API
- Get Order By ID API

### Database

- Products Table
- Orders Table
- Global Secondary Index (userId-index)

## 🚧 Currently In Progress

- Favorites Infrastructure
- Amazon Cognito Integration
- Address Management APIs
- Payment Method APIs
- CloudFront Integration
- CI/CD Automation

# ✨ Current Features

## 🌐 Cloud Infrastructure

- Infrastructure as Code using Terraform
- Modular Terraform Architecture
- Amazon VPC Networking
- Application Load Balancer
- Amazon ECS Fargate
- Amazon ECR Integration
- CloudWatch Logging
- IAM Roles & Policies

---

## 🚀 Serverless Backend

- Product Catalog APIs
- Product Details API
- Product Search API
- Order Management APIs
- Amazon API Gateway
- AWS Lambda
- Amazon DynamoDB
- CloudWatch Monitoring

---

## 📦 Order Management Infrastructure

The infrastructure provisions a complete serverless order management platform.

### Supported Components

- Place Order API
- Get Orders API
- Get Order By ID API
- Orders DynamoDB Table
- Global Secondary Index (userId-index)
- API Gateway Integration
- Lambda IAM Permissions
- CloudWatch Log Groups

---

## 🏗 Container Platform

- Amazon ECS Cluster
- AWS Fargate
- Docker Container Deployment
- Application Load Balancer
- Security Groups
- Auto Scaling Ready

---

# 🏗 Solution Architecture

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
        ┌───────────────────────────┼────────────────────────────┐
        ▼                           ▼                            ▼
 Product APIs                 Search APIs                  Order APIs
        │                           │                            │
        └───────────────────────────┼────────────────────────────┘
                                    ▼
                              AWS Lambda
                                    │
                  ┌─────────────────┴─────────────────┐
                  ▼                                   ▼
        Products DynamoDB                    Orders DynamoDB
                                                   │
                                                   ▼
                                  Global Secondary Index
                                         (userId-index)
```

---

# 🔄 Order Management Workflow

```text
Customer Checkout
        │
        ▼
Amazon API Gateway
        │
        ▼
Place Order Lambda
        │
        ▼
Orders DynamoDB
        │
        ▼
Get Orders Lambda
        │
        ▼
Customer Order History
        │
        ▼
Get Order Details Lambda
        │
        ▼
Order Details Page
```

---

# ☁️ AWS Services Provisioned

## Networking

- Amazon VPC
- Public Subnets
- Internet Gateway
- Route Tables
- Security Groups

---

## Compute

- Amazon ECS Cluster
- AWS Fargate
- AWS Lambda

---

## Containers

- Amazon ECR
- Docker Images

---

## API Layer

- Amazon API Gateway
- REST API Endpoints

---

## Database

- Amazon DynamoDB
  - Products Table
  - Orders Table
  - Global Secondary Index (userId-index)

---

## Monitoring

- Amazon CloudWatch Logs
- Lambda Logging
- ECS Log Groups

---

## Security

- IAM Roles
- IAM Policies
- Lambda Execution Roles
- ECS Task Execution Role

---

## Networking & Routing

- Application Load Balancer
- Route53 (Optional)
# 📁 Repository Structure

```text
terraform-aws-serverless-ecommerce-platform

├── lambda/
│   ├── orders/
│   │   ├── place-order/
│   │   ├── get-orders/
│   │   └── get-order-by-id/
│   │
│   ├── products/
│   │   ├── get-products/
│   │   ├── get-product-by-id/
│   │   └── search-products/
│   │
│   └── shared/
│
├── modules/
│   ├── alb/
│   ├── apigateway/
│   ├── dynamodb/
│   ├── ecs/
│   ├── iam/
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

The infrastructure is organized into reusable Terraform modules to improve maintainability and scalability.

---

## 🌐 VPC Module

Creates:

- Amazon VPC
- Public Subnets
- Internet Gateway
- Route Tables
- Route Table Associations

---

## ⚖️ Application Load Balancer Module

Creates:

- Application Load Balancer
- Target Groups
- HTTP Listener
- Security Groups

Routes external traffic to the ECS service.

---

## 🚢 ECS Module

Creates:

- Amazon ECS Cluster
- ECS Service
- ECS Task Definition
- CloudWatch Log Group
- ECS Task Execution Role

Deploys the Dockerized Next.js application using AWS Fargate.

---

## ⚡ Lambda Module

Deploys all serverless Lambda functions.

### Product APIs

- Get Products
- Get Product By ID
- Search Products

### Order APIs

- Place Order
- Get Orders
- Get Order By ID

Each Lambda includes:

- CloudWatch Logging
- IAM Execution Role
- API Gateway Integration
- DynamoDB Permissions

---

## 🌍 API Gateway Module

Creates REST APIs that expose the serverless backend.

### Products

| Method | Endpoint | Description |
|---------|----------|-------------|
| GET | /products | Retrieve all products |
| GET | /products/{id} | Retrieve product details |
| GET | /products/search | Search products |

### Orders

| Method | Endpoint | Description |
|---------|----------|-------------|
| POST | /orders | Place customer order |
| GET | /orders | Retrieve customer order history |
| GET | /orders/{orderId} | Retrieve customer order details |

---

## 🗄 DynamoDB Module

Creates the following tables.

### Products Table

**Table Name**

```
vlr-products
```

Stores:

- Product Catalog
- Pricing
- Images
- Brand Information
- Product Metadata

---

### Orders Table

**Table Name**

```
vlr-orders
```

Stores:

- Customer Orders
- Purchased Products
- Order Status
- Payment Information
- Shipping Information
- Tracking Information
- Order Totals

---

### Global Secondary Index

```
userId-index
```

Purpose:

Efficiently retrieves all orders belonging to a customer without scanning the table.

---

## 🌎 Route53 Module

(Optional)

Creates DNS records pointing to the Application Load Balancer.

---

# 🚀 Deployment

## 1. Initialize Terraform

```bash
terraform init
```

---

## 2. Validate Configuration

```bash
terraform validate
```

---

## 3. Review Infrastructure Changes

```bash
terraform plan
```

---

## 4. Deploy Infrastructure

```bash
terraform apply
```

---

## 5. Destroy Infrastructure

```bash
terraform destroy
```

---

# 📋 Prerequisites

Before deploying, ensure the following tools and services are available.

## Software

- Terraform 1.x
- AWS CLI
- Docker Desktop
- Git

---

## AWS

- AWS Account
- Configured AWS Credentials
- Amazon ECR Repository

---

## Knowledge

Basic understanding of:

- Terraform
- AWS IAM
- Amazon ECS
- AWS Lambda
- API Gateway
- Amazon DynamoDB
# 📊 Skills Demonstrated

This project demonstrates hands-on experience with modern cloud infrastructure and Infrastructure as Code (IaC).

## Infrastructure as Code

- Terraform
- Modular Terraform Design
- Reusable Infrastructure Modules
- Infrastructure Automation
- Environment Configuration Management

---

## AWS Cloud Services

- Amazon VPC
- Amazon ECS
- AWS Fargate
- Application Load Balancer
- Amazon API Gateway
- AWS Lambda
- Amazon DynamoDB
- Amazon ECR
- IAM
- CloudWatch
- Route53

---

## Serverless

- REST API Infrastructure
- Lambda Deployment
- API Gateway Integration
- DynamoDB Integration
- Serverless Architecture

---

## DevOps

- Docker
- Container Deployment
- Infrastructure Automation
- Cloud-Native Infrastructure
- Git
- GitHub

---

## Architecture

- Cloud-Native Architecture
- Hybrid Container & Serverless Design
- Microservice-Oriented Infrastructure
- Modular Infrastructure Design
- Production-Style AWS Architecture

---

# 🌟 Portfolio Highlights

This project demonstrates the design and implementation of a production-inspired AWS infrastructure supporting a cloud-native luxury retail application.

Highlights include:

- Infrastructure as Code using Terraform
- Modular Terraform architecture
- Hybrid container and serverless deployment
- Amazon ECS Fargate frontend hosting
- REST APIs using Amazon API Gateway
- AWS Lambda serverless backend
- Amazon DynamoDB data modeling
- Complete serverless order management infrastructure
- Global Secondary Index (userId-index) for efficient order retrieval
- IAM least-privilege security model
- CloudWatch logging and monitoring
- Docker container deployment
- Production-style AWS networking
- Infrastructure separated from application code

---

# 📈 Current Infrastructure

## Networking

- Amazon VPC
- Public Subnets
- Internet Gateway
- Route Tables
- Security Groups

---

## Compute

- Amazon ECS Cluster
- AWS Fargate
- AWS Lambda

---

## API Layer

- Amazon API Gateway
- Product APIs
- Search APIs
- Order APIs

---

## Database

### Products

- Product Catalog
- Product Information
- Pricing
- Images

### Orders

- Customer Orders
- Purchased Products
- Order Status
- Shipping Information
- Payment Information
- Tracking Details
- Order Totals

---

## Monitoring

- CloudWatch Log Groups
- ECS Logging
- Lambda Logging

---

## Security

- IAM Roles
- IAM Policies
- Lambda Execution Roles
- ECS Task Execution Roles

---

# 🔄 Infrastructure Roadmap

The following infrastructure enhancements are planned.

## Customer Experience

- Favorites (Wishlist)
- Address Management
- Payment Methods
- User Profile

---

## Security

- Amazon Cognito
- JWT Authorization
- AWS Secrets Manager
- AWS WAF
- HTTPS using ACM

---

## DevOps

- GitHub Actions
- CI/CD Pipeline
- Blue/Green Deployment
- Terraform Remote State
- Automated Lambda Packaging

---

## Observability

- CloudWatch Dashboards
- CloudWatch Alarms
- AWS X-Ray
- Application Monitoring
- Cost Monitoring

---

## Scalability

- CloudFront CDN
- Amazon S3 Static Assets
- Lambda Layers
- API Versioning
- Multi-Environment Deployment

---

# 🔗 Related Repositories

## vinod-luxury-retail-serverless

Application repository containing:

- Next.js Frontend
- React Components
- TypeScript Source Code
- AWS Lambda Business Logic
- REST API Integration
- DynamoDB Seed Scripts
- Docker Configuration

---

## vinod-luxury-retail-local

Prototype version of the application using local JSON data before migrating to AWS serverless services.

---

# ⚠️ Disclaimer

This repository was created exclusively for educational, learning, and portfolio purposes.

The infrastructure provisions AWS resources supporting a fictional luxury retail e-commerce platform and demonstrates modern cloud-native application deployment using Terraform and AWS.

All products, customers, stores, orders, payment methods, addresses, favorites, and other business data referenced by this project are fictional sample data created solely for demonstration purposes.

This project is **not affiliated with, endorsed by, sponsored by, or associated with any retailer, luxury brand, company, or organization**.

Any resemblance to actual companies, products, brands, services, organizations, or trademarks is purely coincidental.

No commercial use is intended.

---

# 👨‍💻 Author

**Vinod Beriki**

DevOps Engineer | AWS | Terraform | Kubernetes | Docker | Serverless | React | Next.js | TypeScript

GitHub

https://github.com/berikivinod

---

# 📄 License

MIT License