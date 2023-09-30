data "aws_iam_policy_document" "aws_s3_bucket" {

  statement {
    sid = "1"
    actions = [
        "s3:*"
    ]
    principals {
        type = "*"
        identifiers = ["*"]
    } 
    resources = ["arn:aws:s3:::${var.s3Bucket}"]
    effect = "Allow"
    condition {
      test = "StringLike"
      variable = "aws:PrincipalArn"
        values = [
            "arn:aws:iam::${var.account}:user/terraform",
            "arn:aws:iam::${var.account}:user/gcarneib"
        ]
    }

  }
  
    statement {
    sid = "2"
    actions = [
        "s3:*"
    ]
    principals {
        type = "*"
        identifiers = ["*"]
    } 
    resources = ["arn:aws:s3:::${var.s3Bucket}"]
    effect = "Deny"
    condition {
      test = "StringLike"
      variable = "aws:PrincipalArn"
        values = [
            "arn:aws:iam::${var.account}:user/user1",
        ]
    }
  }

}