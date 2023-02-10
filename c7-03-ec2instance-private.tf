# AWS EC2 Instance Terraform Module
# Bastion Host - EC2 Instance that will be created in VPC Public Subnet

module "ec2_private" {
  depends_on = [aws_key_pair.ec2-pem, aws_s3_object.upload_files]
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.4"
  count = length(module.vpc.private_subnets)

  # insert the 10 required variables here
  name                   = "${var.environment}-Private-${count.index}"
  ami                    = data.aws_ami.amz_linux.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              =  module.vpc.private_subnets[count.index]
  vpc_security_group_ids = [module.sg_private_api.this_security_group_id]
  iam_instance_profile   = aws_iam_instance_profile.s3_profile.name
  user_data = <<-EOF
      #!/bin/bash
      sudo yum update -y
      curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
      sudo yum install -y unzip
      unzip awscliv2.zip
      sudo aws/install
      aws s3 cp --recursive s3://${var.s3_bucketname}/ ~
    EOF
  tags = local.common_tags
}