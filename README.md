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

The infrastructure combines containerized frontend hosting with serverless backend services to demonstrate Infrastructure as Code (IaC) best practices using reusable Terraform modules.

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
- Amazon ECS
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
│   ├── products/
│   └── search/
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
├── variables.tf
├── outputs.tf
├── providers.tf
├── terraform.tfvars.example
└── README.md
```

---

# 📦 Terraform Modules

### VPC

Creates:

- VPC
- Public Subnets
- Internet Gateway
- Route Tables

---

### ALB

Creates:

- Application Load Balancer
- Target Groups
- Listeners
- Security Groups

---

### ECS

Creates:

- ECS Cluster
- ECS Service
- ECS Task Definition
- CloudWatch Log Group
- IAM Execution Role

---

### Lambda

Deploys multiple Lambda functions for:

- Product APIs
- Search APIs
- Shopping Cart APIs

---

### API Gateway

Creates REST APIs including:

| Method | Endpoint |
|---------|----------|
| GET | /products |
| GET | /products/{id} |
| GET | /products/search |
| GET | /cart |
| POST | /cart |
| PUT | /cart |
| DELETE | /cart |

---

### DynamoDB

Creates tables including:

- vlr-products
- vlr-cart

---

### Route53

Creates DNS records for the Application Load Balancer (optional).

---

# 🚀 Deployment

Initialize Terraform

```bash
terraform init
```

Validate configuration

```bash
terraform validate
```

Review infrastructure

```bash
terraform plan
```

Deploy

```bash
terraform apply
```

Destroy

```bash
terraform destroy
```

---

# 📋 Prerequisites

- Terraform 1.x
- AWS CLI
- AWS Account
- Docker
- Amazon ECR Repository
- Existing AWS credentials

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

---

# 🔄 Future Enhancements

Planned improvements include:

- Amazon Cognito
- AWS WAF
- CloudFront
- HTTPS using ACM
- Auto Scaling
- GitHub Actions CI/CD
- Blue/Green Deployments
- Multi-Environment Support
- Terraform Remote State

---

# 🔗 Related Repositories

### vinod-luxury-retail-local

Local prototype using JSON files.

### vinod-luxury-retail-serverless

Application repository containing the Next.js frontend, Lambda source code, and serverless application logic.

---

# ⚠️ Disclaimer

This repository contains Infrastructure as Code created for educational, learning, and portfolio purposes.

The Terraform modules provision AWS infrastructure to support a sample e-commerce application.

No production customer data or proprietary business information is included.

---

# 👨‍💻 Author

**Vinod Beriki**

DevOps Engineer | AWS | Terraform | Kubernetes

GitHub:
https://github.com/berikivinod

---

# 📄 License

MIT License