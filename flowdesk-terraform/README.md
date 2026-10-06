# Flowdesk infrastructure - Terraform (Part B)

This folder automates the exact AWS infrastructure built by hand in Part A,
using Terraform. Running it from scratch reproduces: a Multi-AZ VPC, an
Application Load Balancer, an Auto Scaling Group of EC2 instances serving
Flowdesk via nginx, a Multi-AZ RDS MySQL database, an S3 bucket for static
files, and CloudWatch monitoring.

## What the code does

- **modules/network** - VPC, public/private subnets across 2 AZs, internet
  gateway, route tables, and an S3 Gateway endpoint (used instead of a NAT
  Gateway to keep private-subnet EC2 instances able to reach S3 for free).
- **modules/security** - security groups for the ALB, EC2, and RDS, plus the
  IAM role/instance profile that lets EC2 read from the S3 bucket.
- **modules/storage** - the S3 bucket, with Flowdesk's static files (index.html,
  styles.css, script.js) uploaded automatically from a local folder.
- **modules/compute** - the Launch Template (installs nginx and pulls Flowdesk's
  files from S3 on boot), the ALB, target group, listener, Auto Scaling Group,
  and a target-tracking scaling policy on average CPU.
- **modules/database** - the Multi-AZ RDS MySQL instance, in private subnets.
- **modules/monitoring** - a CloudWatch alarm for high CPU and a dashboard
  covering EC2, ALB, and RDS metrics.

## Prerequisites

- An AWS account with credentials configured locally (`aws configure`, or
  environment variables) - confirm with `aws sts get-caller-identity`.
- [Terraform](https://developer.hashicorp.com/terraform/install) >= 1.5 installed
  and on your PATH - confirm with `terraform -version`.
- An existing EC2 key pair in your AWS account (matching `var.key_name`).
- Flowdesk's static files (`index.html`, `styles.css`, `script.js`) available
  locally at the path set in `flowdesk_static_files_path`.

## Environment variables / configuration

Copy the example variables file and fill in your own values:

```bash
cp terraform.tfvars.example terraform.tfvars
```

At minimum, set: `s3_bucket_name` (must be globally unique), `key_name`,
`flowdesk_static_files_path`, and `db_password`. `terraform.tfvars` is
gitignored - never commit real secrets. Alternatively, set the password via
an environment variable instead of a file:

```bash
export TF_VAR_db_password="your-strong-password"
```

## How to deploy it

```bash
terraform init      # downloads the AWS provider, sets up the working directory
terraform plan       # shows exactly what will be created, before touching AWS
terraform apply      # creates everything - type "yes" to confirm
```

After it finishes, Terraform prints outputs including `alb_dns_name` - open
that URL in a browser to see Flowdesk running live on the infrastructure.

To tear everything down when you're done (recommended between sessions to
avoid ongoing RDS/ALB charges):

```bash
terraform destroy
```

## Troubleshooting

- **`Error: error configuring Terraform AWS Provider`** - your AWS credentials
  aren't configured in this terminal. Run `aws configure` or set
  `AWS_ACCESS_KEY_ID` / `AWS_SECRET_ACCESS_KEY` environment variables.
- **`BucketAlreadyExists` on the S3 bucket** - S3 bucket names are globally
  unique across all AWS accounts, not just yours. Change `s3_bucket_name` in
  `terraform.tfvars` to something more unique.
- **`InvalidKeyPair.NotFound`** - the key pair named in `key_name` doesn't
  exist in this AWS region. Create one in the EC2 console first, or update
  `key_name` to match an existing one.
- **ALB target group shows unhealthy targets** - give it a few minutes after
  `apply` finishes; instances need time to boot, run the user_data script,
  and pass health checks. If it persists, check the instance's system log in
  the EC2 console for errors installing nginx or pulling from S3.
- **Terraform hangs on `aws_db_instance` creation** - this is normal; Multi-AZ
  RDS can take 10-15 minutes to provision. Let it run.

## Architecture diagram

See [`../docs/architecture-diagram.png`](../docs/architecture-diagram.png) in
the repo root for the full architecture this code builds.
