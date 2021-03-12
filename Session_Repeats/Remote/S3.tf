resource "aws_s3_bucket" "remote_state" {
  bucket = "terraform-remote-state-alcode88"

  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }
  lifecycle {
      prevent_destroy = true
  }
}

resource "aws_s3_bucket_policy" "state_policy" {
  bucket = aws_s3_bucket.remote_state.id
  policy = data.aws_iam_policy_document.state_policy_document.json
}

data "aws_iam_policy_document" "state_policy_document" {
  statement {
    sid = "RemoteStatePolicy"

    actions = [
      "s3:GetObject",
      "s3:PutObject",
    ]

    resources = [
      "${aws_s3_bucket.remote_state.arn}/*",
    ]

    principals {
        type = "AWS"
        identifiers = ["arn:aws:iam::799700054245:user/terraform"]
    }
  }

  statement {
    actions = [
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.remote_state.arn
    ]

    principals {
        type = "AWS"
        identifiers = ["arn:aws:iam::799700054245:user/terraform"]
    }
  }
}