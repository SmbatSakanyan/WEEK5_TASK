resource "aws_iam_role" "EC2_ECR" {
  name = var.IAM_ROLE
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Effect = "Allow"
      }
    ]
  })
  path = "/"
}
resource "aws_iam_policy" "ecr_policy" {
  name = "ecr_policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ecr:*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "attach" {
  name       = "attach"
  roles      = ["${aws_iam_role.EC2_ECR.name}"]
  policy_arn = aws_iam_policy.ecr_policy.arn
}

resource "aws_iam_instance_profile" "EC2_profile" {
  name = var.instance_profile_name
  role = aws_iam_role.EC2_ECR.name
}
