terraform {
  backend "s3" {
    bucket         = "tf-backend-s3-week5"
    key            = "terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "week5-state-lock"
  }
}
