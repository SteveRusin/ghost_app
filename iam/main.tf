resource "aws_iam_policy" "ec2_ghost_app" {
  name        = "ec2_ghost_app_access"
  path        = "/"
  description = ""

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
          "elasticfilesystem:DescribeFileSystems",
          "elasticfilesystem:ClientMount",
          "elasticfilesystem:ClientWrite"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role" "ghost_app" {
  name = "ghost_app"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ghost_app_attach" {
  role       = aws_iam_role.ghost_app.name
  policy_arn = aws_iam_policy.ec2_ghost_app.arn
}
