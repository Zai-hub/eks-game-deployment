terraform {
  required_version = ">= 1.6.0"

  backend "s3" {
    bucket         = "eks-game-state"
    dynamodb_table = "eks-game-lock"
    key            = "main/terraform.tfstate"
    region         = "eu-west-2"
    encrypt        = true
  }
}
