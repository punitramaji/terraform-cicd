locals {
  account_id = data.aws_caller_identity.current.account_id
}

resource "aws_kms_key" "encryption_key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
  policy                  = data.aws_iam_policy_document.kms_key_policy_doc.json
  enable_key_rotation     = true
}

data "aws_iam_policy_document" "kms_key_policy_doc" {
  statement {
    sid       = "Enable IAM User Permissions"
    effect    = "Allow"
    actions   = ["kms:*"]
    #checkov:skip=CKV_AWS_111:Without this statement, KMS key cannot be managed by root
    #checkov:skip=CKV_AWS_109:Without this statement, KMS key cannot be managed by root
    resources = ["*"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${local.account_id}:root"]
    }
  }
}
