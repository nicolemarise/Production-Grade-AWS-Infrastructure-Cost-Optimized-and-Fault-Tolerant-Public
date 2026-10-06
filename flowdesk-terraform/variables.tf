variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Short name used to prefix/tag all resources"
  type        = string
  default     = "flowdesk"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Availability zones to spread subnets across"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets, one per AZ"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets, one per AZ"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "instance_type" {
  description = "EC2 instance type for the web servers"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of an existing EC2 key pair to attach to instances"
  type        = string
  default     = "flowdesk-key"
}

variable "asg_min_size" {
  description = "Minimum number of instances in the Auto Scaling Group"
  type        = number
  default     = 2
}

variable "asg_desired_capacity" {
  description = "Desired number of instances in the Auto Scaling Group"
  type        = number
  default     = 2
}

variable "asg_max_size" {
  description = "Maximum number of instances in the Auto Scaling Group"
  type        = number
  default     = 4
}

variable "cpu_target_value" {
  description = "Target average CPU utilization for the scaling policy"
  type        = number
  default     = 50
}

variable "high_cpu_alarm_threshold" {
  description = "CPU percentage that triggers the high-CPU CloudWatch alarm"
  type        = number
  default     = 70
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "db_engine_version" {
  description = "MySQL engine version for RDS"
  type        = string
  default     = "8.4"
}

variable "db_name" {
  description = "Initial database name"
  type        = string
  default     = "flowdeskdb"
}

variable "db_username" {
  description = "Master username for RDS"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Master password for RDS. Set this via terraform.tfvars (gitignored) or TF_VAR_db_password env var - never commit it."
  type        = string
  sensitive   = true
}

variable "db_allocated_storage" {
  description = "Allocated storage for RDS, in GiB"
  type        = number
  default     = 20
}

variable "db_multi_az" {
  description = "Whether RDS runs Multi-AZ (standby replica in a second AZ)"
  type        = bool
  default     = true
}

variable "s3_bucket_name" {
  description = "Globally unique name for the S3 bucket holding Flowdesk static files"
  type        = string
}

variable "flowdesk_static_files_path" {
  description = "Local path to the Flowdesk static files (index.html, styles.css, script.js) to upload to S3"
  type        = string
  default     = "../FLowDesk"
}
