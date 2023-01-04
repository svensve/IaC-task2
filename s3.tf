#Create AWS S3 bucket 

resource "aws_s3_bucket" "my-bucket-task2" {
  bucket = "my-tf-task2-bucket"
  
  tags = {
    Name        = "My tf test bucket"
    
  }
}

resource "aws_s3_bucket_public_access_block" "public-access-my-bucket-task2" {
  bucket = aws_s3_bucket.my-bucket-task2.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
resource "aws_s3_bucket_versioning" "versioning-my-bucket-task2" {
  bucket = aws_s3_bucket.my-bucket-task2.id
  versioning_configuration {
    status = "Enabled"
  }
}

#resource "aws_s3_bucket_acl" "private-my-bucket-task2" {
# bucket = aws_s3_bucket.my-bucket-task2.id
# acl    = "private"
  #aws_s3_bucket_acl = "private"
#}