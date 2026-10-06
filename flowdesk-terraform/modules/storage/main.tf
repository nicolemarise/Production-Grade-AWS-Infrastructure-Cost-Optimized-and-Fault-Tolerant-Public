resource "aws_s3_bucket" "static_files" {
  bucket = var.s3_bucket_name

  tags = {
    Name = "${var.project_name}-static-files"
  }
}

resource "aws_s3_bucket_public_access_block" "static_files" {
  bucket = aws_s3_bucket.static_files.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Uploads index.html, styles.css, script.js (and anything else) found in
# the Flowdesk static files folder. EC2 instances pull these via the S3
# gateway endpoint at boot time (see the compute module's user_data).
locals {
  content_types = {
    ".html" = "text/html"
    ".css"  = "text/css"
    ".js"   = "application/javascript"
  }
}

resource "aws_s3_object" "static_files" {
  for_each = fileset(var.flowdesk_static_files_path, "*")

  bucket       = aws_s3_bucket.static_files.id
  key          = each.value
  source       = "${var.flowdesk_static_files_path}/${each.value}"
  etag         = filemd5("${var.flowdesk_static_files_path}/${each.value}")
  content_type = lookup(local.content_types, regex("\\.[^.]+$", each.value), "application/octet-stream")
}
