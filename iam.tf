resource "aws_iam_role" "my_tf_S3_role_task2" {
  name = "my_tf_S3_role_task2"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "my_s3_read-only_Policy" {
  name        = "my_s3_read-only_Policy"
  description = "Read only policy"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:GetLifecycleConfiguration",
                "s3:GetBucketTagging",
                "s3:GetInventoryConfiguration",
                "s3:GetObjectVersionTagging",
                "s3:GetBucketLogging",
                "s3:GetAccelerateConfiguration",
                "s3:GetObjectVersionAttributes",
                "s3:GetBucketPolicy",
                "s3:GetObjectVersionTorrent",
                "s3:GetObjectAcl",
                "s3:GetEncryptionConfiguration",
                "s3:GetBucketObjectLockConfiguration",
                "s3:GetIntelligentTieringConfiguration",
                "s3:GetBucketRequestPayment",
                "s3:GetObjectVersionAcl",
                "s3:GetObjectTagging",
                "s3:GetMetricsConfiguration",
                "s3:GetBucketOwnershipControls",
                "s3:GetBucketPublicAccessBlock",
                "s3:GetBucketPolicyStatus",
                "s3:GetObjectRetention",
                "s3:GetBucketWebsite",
                "s3:GetObjectAttributes",
                "s3:GetBucketVersioning",
                "s3:GetBucketAcl",
                "s3:GetObjectLegalHold",
                "s3:GetBucketNotification",
                "s3:GetReplicationConfiguration",
                "s3:GetObject",
                "s3:GetObjectTorrent",
                "s3:GetBucketCORS",
                "s3:GetAnalyticsConfiguration",
                "s3:GetObjectVersionForReplication",
                "s3:GetBucketLocation",
                "s3:GetObjectVersion"
            ],
            "Resource": [
                "arn:aws:s3:::my-tf-task2-bucket",
                "arn:aws:s3:::my-tf-task2-bucket/*"
            ]
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "s3:GetAccessPoint",
                "s3:GetAccountPublicAccessBlock"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "Policy-attach" {
  role       = aws_iam_role.my_tf_S3_role_task2.id
  policy_arn = aws_iam_policy.my_s3_read-only_Policy.arn
}