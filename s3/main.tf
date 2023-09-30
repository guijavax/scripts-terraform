terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "bucket_bk" {
  bucket = var.s3Bucket

  tags = {
    Name        = "borges-bucket"
    Environment = "Dev"
  }
  policy = data.aws_iam_policy_document.aws_s3_bucket.json
}