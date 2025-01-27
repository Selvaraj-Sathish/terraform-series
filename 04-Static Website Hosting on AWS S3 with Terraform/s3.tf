locals {
  common_tags = {
    managedby = "terraform"
    project = "demo-s3-static-web"
    author = "sathish"
  }
}

resource "random_id" "bucket_suffix" {
  byte_length = 8

}

resource "aws_s3_bucket" "webstatic" {
  bucket = "static-web-${random_id.bucket_suffix.hex}"

  tags = merge(local.common_tags, {
    name = "s3-static"
  }
  )
}

resource "aws_s3_bucket_public_access_block" "webstatic" {
  bucket = aws_s3_bucket.webstatic.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false

}

resource "aws_s3_bucket_policy" "staticweb_publicread" {
  bucket = aws_s3_bucket.webstatic.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "readobject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "S3:GetObject"
        Resource  = "${aws_s3_bucket.webstatic.arn}/*"
      }
    ]
  })

}

resource "aws_s3_bucket_website_configuration" "staticweb" {
  bucket = aws_s3_bucket.webstatic.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}

resource "aws_s3_object" "index_doc" {
  bucket       = aws_s3_bucket.webstatic.id
  key          = "index.html"
  source       = "build/index.html"
  etag         = filemd5("build/index.html")
  content_type = "text/html"

}

resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.webstatic.id
  key          = "error.html"
  source       = "build/error.html"
  etag         = filemd5("build/error.html")
  content_type = "text/html"

}
