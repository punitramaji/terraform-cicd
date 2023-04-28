terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.20.1"
    }
  }

}

#Module for creating a new S3 bucket for storing pipeline artifacts
module "s3_artifacts_bucket" {
  source       = "./modules/s3"
  project_name = var.project_name
}

module "codepipeline_kms" {
  source                = "./modules/kms"
}

module "codepipeline_iam_role" {
  source                     = "./modules/iam-role"
  project_name               = var.project_name
  create_new_role            = var.create_new_role
  codepipeline_iam_role_name = var.create_new_role == true ? "${var.project_name}-codepipeline-role" : var.codepipeline_iam_role_name
}
