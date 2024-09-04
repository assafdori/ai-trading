terraform {
  backend "s3" {
    bucket         = "ai-trading-terraform-state-bucket"
    key            = "ai-trading-terraform.tfstate"
    region         = "us-east-1"
  }
}
