# S3
# https://registry.terraform.io/modules/terraform-aws-modules/s3-bucket/aws/latest

s3_bucketname = "ugurustaoglu-test-bucket"
s3_acls       = null # [private public-read public-read-write authenticated-read aws-exec-read log-delivery-write]

s3_attach_policy                    = true # Controls if S3 bucket should have bucket policy attached
s3_attach_deny_insecure_transport_policy   = true # Controls if S3 bucket should have deny non-SSL transport policy attached
s3_attach_require_latest_tls_policy = true # Controls if S3 bucket should require the latest version of TLS

s3_block_public_acls = true # Whether Amazon S3 should block public ACLs for this bucket.
s3_block_public_policy = true # Controls if a user defined public bucket policy will be attached (set to false to allow upstream to apply defaults to the bucket)

s3_ignore_public_acls      = true                  # Whether Amazon S3 should ignore public ACLs for this bucket.
s3_restrict_public_buckets = true                  # Whether Amazon S3 should restrict public bucket policies for this bucket.
s3_bucket_ownership        = "BucketOwnerEnforced" # [BucketOwnerPreferred ObjectWriter BucketOwnerEnforced]
