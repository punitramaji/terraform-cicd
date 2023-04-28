variable "project_name" {
  description = "Unique name for this project"
  type        = string
}

variable "create_new_role" {
  type        = bool
  description = "Flag for deciding if a new role needs to be created"
  default     = true
}

variable "codepipeline_iam_role_name" {
  description = "Name of the IAM role to be used by the project"
  type        = string
}

variable "project_name" {
  description = "Unique name for this project"
  type        = string
}

variable "s3_bucket_arn" {
  description = "The ARN of the S3 Bucket"
  type        = string
}
