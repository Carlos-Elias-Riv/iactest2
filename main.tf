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
  region     = "us-east-2"
  access_key = "AKIAV3E7NPDIIUFGI5MY"
  secret_key = "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"
}


resource "aws_ecr_repository" "foo" {
  name                 = "repotest"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}
