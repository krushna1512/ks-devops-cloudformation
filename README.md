# ☁️ AWS CloudFormation – ECS Cluster & Network Infrastructure

## 👋 Overview
This repository contains **AWS CloudFormation templates** that provision a
**production-ready ECS environment** along with all required supporting
infrastructure.

The stack creates:
- A fully configured **VPC**
- **Public and private subnets**
- **Security groups**
- **Application Load Balancer**
- **Service Discovery**
- **ECS Cluster and ECS Services**

The templates are designed to reflect **real-world ECS deployments** using
Infrastructure as Code (IaC).

---

## 🎯 Objectives
- Provision ECS infrastructure using CloudFormation
- Create a secure and scalable VPC architecture
- Enable service-to-service communication via service discovery
- Deploy containerized applications using ECS services
- Reduce manual infrastructure configuration

---

### 🔧 Tech Stack
- **IaC:** AWS CloudFormation
- **Containers:** Amazon ECS
- **Networking:** VPC, Subnets, Security Groups
- **Load Balancing:** Application Load Balancer
- **Service Discovery:** AWS Cloud Map

---

## 🧠 How It Works
The CloudFormation templates create a VPC with both public and private subnets.
Public subnets host the Application Load Balancer, while private subnets are used
for ECS tasks.

Security groups control inbound and outbound traffic between the load balancer,
ECS services, and other resources. An ECS cluster is provisioned to run containerized
applications.

Service discovery is enabled using AWS Cloud Map, allowing ECS services to discover
each other by name. ECS services are deployed and registered behind the load balancer,
providing scalable and highly available application access.

---
