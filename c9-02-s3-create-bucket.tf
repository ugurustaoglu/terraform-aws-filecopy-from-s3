module "s3-bucket-create" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.6.1"
  bucket  = var.s3_bucketname
  acl     = var.s3_acls


  # Bucket policies
  attach_policy                         = var.s3_attach_policy
  policy                                = data.aws_iam_policy_document.bucket_policy.json
  attach_deny_insecure_transport_policy = var.s3_attach_deny_insecure_transport_policy
  attach_require_latest_tls_policy      = var.s3_attach_require_latest_tls_policy


  # S3 bucket-level Public Access Block configuration
  block_public_acls       = var.s3_block_public_acls
  block_public_policy     = var.s3_block_public_policy
  ignore_public_acls      = var.s3_ignore_public_acls
  restrict_public_buckets = true

  # S3 Bucket Ownership Controls
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls
  control_object_ownership = true
  object_ownership         = var.s3_bucket_ownership
}