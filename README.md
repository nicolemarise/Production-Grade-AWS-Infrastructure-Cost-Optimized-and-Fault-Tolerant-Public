🔗 **Live Demo (Before - static site):** [Flowdesk](https://nicolemarise.github.io/Production-Grade-AWS-Infrastructure-Cost-Optimized-and-Fault-Tolerant-Public/FLowDesk/)

🔗 **Live Demo (After - AWS infra):** http://flowdesk-alb-2026873328.us-east-1.elb.amazonaws.com


## The Business Challenge

The business required a **highly available and highly scalable application** capable of handling traffic spikes without downtime, while avoiding the unnecessary costs associated with idle servers.

## Solution

I designed a **highly available AWS infrastructure** targeting **10K requests per hour**, **99.99% uptime**, and a **40% reduction in operating costs** through Auto Scaling and a Multi-AZ architecture.

## Execution

I implemented a **Multi-AZ VPC** with public and private subnets, an **Application Load Balancer (ALB)** with health checks, **EC2 Auto Scaling based on CPU utilisation**, **Multi-AZ Amazon RDS in private subnets**, **Amazon S3 for static content**, and **Amazon CloudWatch alarms and dashboards** for monitoring and observability.

The project is divided into two parts:

- **Part A:** Design and deployment of the AWS infrastructure.
- **Part B:** Automation of the infrastructure using Terraform Infrastructure as Code (IaC).

## Architecture Diagram

_(diagram coming once infra is built)_

<img width="1919" height="993" alt="image" src="https://github.com/user-attachments/assets/6cec1a13-bf4e-47e0-9e6a-f2c5d4c1340a" />
<img width="1919" height="990" alt="image" src="https://github.com/user-attachments/assets/b131bc29-6e6f-4d74-9dc4-3070b4a1807c" />
<img width="1919" height="988" alt="image" src="https://github.com/user-attachments/assets/aa67438a-26b1-423c-acda-f8973661c9c7" />
<img width="1919" height="991" alt="image" src="https://github.com/user-attachments/assets/61eba25d-0895-4efe-88c1-28552730c7c8" />
<img width="1919" height="994" alt="image" src="https://github.com/user-attachments/assets/662f5abb-1dd4-4331-9e57-067973c5f259" />
<img width="1919" height="990" alt="image" src="https://github.com/user-attachments/assets/6114dee7-feb0-4371-aebb-6cad1e0ab1a6" />
<img width="1919" height="994" alt="image" src="https://github.com/user-attachments/assets/7cebcbda-33c2-4ec4-a5b7-76f5dc25e3c9" />
<img width="1919" height="995" alt="image" src="https://github.com/user-attachments/assets/40b6f708-4de2-403a-9756-008f3645d482" />
<img width="1919" height="989" alt="image" src="https://github.com/user-attachments/assets/36026bdd-4fdc-4ab4-8f4b-89292d051ada" />
<img width="1919" height="995" alt="image" src="https://github.com/user-attachments/assets/b597ec19-ba11-4f22-a367-7ba97583db7d" />
<img width="1364" height="767" alt="image" src="https://github.com/user-attachments/assets/a38b71a0-454d-4986-a1dc-3f288ee81337" />
<img width="1363" height="767" alt="image" src="https://github.com/user-attachments/assets/7264e9a5-7488-4dba-b0e4-2eb58e2ea244" />
<img width="1363" height="682" alt="image" src="https://github.com/user-attachments/assets/ce631d9c-b8e7-44ff-aaec-61a358775438" />
<img width="1365" height="685" alt="image" src="https://github.com/user-attachments/assets/806793f9-c50b-4713-b7c3-e5b99d773d53" />
<img width="1363" height="726" alt="image" src="https://github.com/user-attachments/assets/cc8ac986-a6aa-444c-a4d6-9fb0850fa4b0" />



















