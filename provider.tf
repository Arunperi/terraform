terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.91.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "devops_s3_31437" {
  bucket = "devops-s3-31437"
}

resource "aws_s3_bucket_public_access_block" "public_access" {
    bucket = aws_s3_bucket.devops_s3_31853.id
    block_public_acls = false
    block_public_policy = false
    ignore_public_acls = false
    restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "public_acl" {
    depends_on = [ aws_s3_bucket_public_access_block.public_access ]
    bucket = aws_s3_bucket.devops_s3_31853.id
    acl = "public-read"
}