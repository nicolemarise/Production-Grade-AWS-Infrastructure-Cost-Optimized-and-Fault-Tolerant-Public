## The Business Challenge

The business required a **highly available and highly scalable application** capable of handling traffic spikes without downtime, while avoiding the unnecessary costs associated with idle servers.

## Solution

I designed a **highly available AWS infrastructure** targeting **10K requests per hour**, **99.99% uptime**, and a **40% reduction in operating costs** through Auto Scaling and a Multi-AZ architecture.

## Execution

I implemented a **Multi-AZ VPC** with public and private subnets, an **Application Load Balancer (ALB)** with health checks, **EC2 Auto Scaling based on CPU utilisation**, **Multi-AZ Amazon RDS in private subnets**, **Amazon S3 for static content**, and **Amazon CloudWatch alarms and dashboards** for monitoring and observability.

The project is divided into two parts:

- **Part A:** Design and deployment of the AWS infrastructure.
- **Part B:** Automation of the infrastructure using Terraform Infrastructure as Code (IaC).
