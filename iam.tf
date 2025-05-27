resource "aws_iam_user" "frontend-pipeline" {
  name = "frontend-pipeline"
}

resource "aws_iam_user_policy" "frontend-pipeline-policy" {
  name = "frontend-pipeline-policy"
  user = aws_iam_user.frontend-pipeline.name
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:Put*",
          "s3:Get*",
          "s3:Delete*",
          "s3:List*"
        ],
        "Resource" : [
          aws_s3_bucket.frontend.arn,
          "${aws_s3_bucket.frontend.arn}/*",
        ]
    }]
  })
}

resource "aws_iam_user" "backend-pipeline" {
  name = "backend-pipeline"
}

resource "aws_iam_user_policy" "backend-pipeline-policy" {
  name = "backend-pipeline-policy"
  user = aws_iam_user.backend-pipeline.name
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "ec2:RevokeSecurityGroupIngress",
          "ec2:AuthorizeSecurityGroupIngress"
        ],
        "Resource" : aws_security_group.hotel-server.arn
      }
    ]
  })
}

resource "aws_iam_user" "hotel-db-url-secret" {
  name = "secret"
}

resource "aws_iam_user_policy" "hotel-db-url-secret" {
  name = "secret"
  user = aws_iam_user.hotel-db-url-secret.name
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ],
        "Resource" : aws_secretsmanager_secret.hotel-db-url.arn
      }
    ]
  })
}