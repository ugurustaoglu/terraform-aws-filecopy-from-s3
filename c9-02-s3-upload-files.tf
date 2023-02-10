resource "aws_s3_object" "upload_files" {
  depends_on = [module.s3-bucket-create]
  for_each = fileset("./documents/", "**")
  bucket = var.s3_bucketname
  key = each.value
  source = "./documents/${each.value}"
  etag = filemd5("./documents/${each.value}")
}