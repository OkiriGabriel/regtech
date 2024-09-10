resource "aws_iam_role" "regtech" {
  name = var.iam_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })
}


resource "aws_iam_policy" "regtech" {
  name        = "security-audit-role"
  description = "security-audit-role"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "s3:GetObject"
        Resource = "arn:aws:s3:::${aws_s3_bucket.secure.bucket}/*"
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "regtech" {
  policy_arn = aws_iam_policy.regtech.arn
  role     = aws_iam_role.regtech.name
}
