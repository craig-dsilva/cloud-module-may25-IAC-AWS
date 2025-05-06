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