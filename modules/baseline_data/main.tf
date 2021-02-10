
data "terraform_remote_state" "baseline" {
  backend = "s3"

  config = {
    bucket         = var.bucket_name
    key            = var.bucket_key
    region         = var.region
  }
}