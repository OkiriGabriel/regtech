# backend.tf

terraform {
  backend "s3" {
    bucket         = "javasapp"
    key            = "terraform/state/terraform.tfstate"  
    region         = "us-east-1"                   
    encrypt        = true                            
    acl            = "bucket-owner-full-control" 
  }
}
