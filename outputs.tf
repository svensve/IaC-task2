output "vpc" {
  value = aws_vpc.vpc.id
  description = "ID of the VPC"
}

output "aws_Public_subnet" {
  description = "List of IDs of Public subnets"
  value       = aws_subnet.public-subnet-1.id
}

output "aws_Private_subnet" {
  description = "List of IDs of Private subnets"
  value       = aws_subnet.private-subnet-1.id
}

output "aws_IAM_role" {
  description = "List of IAM roles"
  value       = aws_iam_role.my_tf_S3_role_task2.id
}

output "aws_iam_policy_ARN" {
  description = "List of ARNs"
  value       = aws_iam_policy.my_s3_read-only_Policy.arn
}