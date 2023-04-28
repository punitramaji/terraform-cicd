output "arn" {
  value       = aws_s3_bucket.codepipeline_bucket.arn
  description = "The ARN of the S3 Bucket"
}

output "bucket" {
  value       = aws_s3_bucket.codepipeline_bucket.bucket
  description = "The Name of the S3 Bucket"
}
