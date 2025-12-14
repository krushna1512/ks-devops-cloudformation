# ☁️ AWS Infrastructure Setup – Step-by-Step Guide

## 👋 Overview
This document provides a **step-by-step guide** to provision and configure
AWS infrastructure using **CloudFormation, ECS, RDS, API Gateway, Lambda,
CloudFront, and Route 53**.

The guide is intended for **new environment setup** across **development,
staging, and production**, following consistent and repeatable practices.

---

## 🎯 Purpose
- Create complete application infrastructure from scratch
- Maintain consistency across environments
- Reduce manual configuration errors
- Serve as a reference for future AWS account setups

---

## 🌍 Region Selection
- **Development / Staging:** Mumbai (`ap-south-1`)
- **Production:** N. Virginia (`us-east-1`)

Ensure you are logged into the **correct AWS account and region** before starting.

---

## 🔐 Step 1: Create EC2 Key Pairs
1. Go to **EC2 → Key Pairs**
2. Create key pairs for each environment:
   - Development
   - Staging
   - Production
3. Add tags:
   - `project: <project-name>`
4. Download and securely store the keys:
   - Save them in a secure DevOps folder
   - Restrict access appropriately

---

## 🏗️ Step 2: Deploy CloudFormation Stacks
Go to **AWS CloudFormation** and deploy stacks in the following order.

> Ensure `EnvironmentName` and `project` tags are correctly set for each environment.

### Required Stacks
1. **VPC Stack**
   - Creates VPC, public and private subnets, route tables, and gateways

2. **Service Discovery Stack**
   - Enables service-to-service discovery

3. **ECS Cluster Stack**
   - Creates the ECS cluster

4. **Load Balancer Stack**
   - Internal load balancer for services

5. **Public Load Balancer Stack**
   - Public-facing load balancer

6. **Sitemaps Stack**
   - Supporting infrastructure for sitemap-related services

---

## 🗄️ Step 3: Create RDS Database
1. Create an RDS instance
2. Attach it to the correct **VPC and Security Groups**
3. Create a **custom DB parameter group**
4. Save database credentials securely
5. Enable **RDS logs**
6. Set backup retention:
   - **Production:** 30 days
   - **Development / Staging:** 7 days

---

## 🔑 Step 4: Configure Parameter Store
1. Go to **AWS Systems Manager → Parameter Store**
2. Add required parameters with:
   - Environment-specific names
   - Correct values per environment
3. Ensure:
   - No production values are reused in non-prod
   - Naming is consistent across environments

---

## 🌐 Step 5: API Gateway Setup
1. Export API configuration from Development
2. Import it into a new **REST API**
3. Update API name in scripts
4. Configure **Stage Variables**, including:
   - `vpcLinkId` – from API Gateway VPC Links
   - `nlbPath` – DNS name of the Network Load Balancer

---

## 📣 Step 6: SNS Configuration
1. Create an SNS topic for application events
2. Configure subscriptions as required

---

## 📦 Step 7: S3 Configuration
1. Create required S3 buckets:
   - Deployment bucket
2. Upload:
   - Event schemas
   - Supporting assets

---

## 🖼️ Step 8: Deploy Image Processing Service
1. Deploy the Image Processor service
2. Add **API Gateway trigger** to the Lambda function
3. Ensure Lambda permissions allow API Gateway invocation

---

## 🚀 Step 9: Deploy ECS Services
1. Deploy all ECS services
2. Verify tasks are running in private subnets
3. Confirm service registration with load balancers

---

## 🔒 Step 10: Security Hardening
1. Restrict Application Load Balancer security group:
   - Allow only required ports (e.g., `8156`)
2. Remove unnecessary port ranges

---

## 🌍 Step 11: Domain & CloudFront Setup
1. Add CloudFront distribution
2. Point Route 53 domain record to CloudFront
3. Invalidate CloudFront cache
4. Verify HTTPS and routing

---

## ✅ Step 12: Testing & Validation
- Verify API endpoints
- Validate ECS services
- Confirm database connectivity
- Check CloudFront routing
- Ensure logs are enabled and accessible

---

## ⚠️ Important Notes
- Always double-check environment and region before deploying
- Use separate values for dev, staging, and production
- Keep credentials and keys secure
- Avoid copying production configuration into non-prod
- Maintain documentation for future setups

---

## 📈 What This Document Demonstrates
- End-to-end AWS infrastructure provisioning
- Environment-based deployment strategy
- Secure and scalable architecture
- Real-world DevOps operational practices

---

⭐ *Well-documented infrastructure ensures faster onboarding, safer deployments, and easier troubleshooting.*
