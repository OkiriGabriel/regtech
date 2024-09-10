resource "aws_s3_bucket" "secure" {
  bucket = var.s3_bucket_name
  force_destroy = true

  # Additional S3 bucket configuration goes here
}

resource "aws_s3_bucket_server_side_encryption_configuration" "secure" {
  bucket = aws_s3_bucket.secure.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"  # or "aws:kms" for KMS-managed keys
      # Optional for KMS: kms_master_key_id = "arn:aws:kms:region:account-id:key/key-id"
    }
  }
}

resource "aws_s3_bucket_website_configuration" "secure" {
  bucket = aws_s3_bucket.secure.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}
