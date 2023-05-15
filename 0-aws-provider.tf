provider "aws" {
  region = "eu-west-1"
  # version = "4.67.0"
}

terraform {
  backend "s3" {       # √ Terraform state store backend
    bucket = "devopsengineersm-terraform-state-backend"
    key = "terraform.tfstate"
    region = "eu-west-1"
    dynamodb_table = "terraform_state"

  }
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl" # √ This provider allows you to manage kubernetes resources by using yaml
      version = ">= 1.14.0"  # √ The latest version as of 15th May
    }
    helm = {
      source  = "hashicorp/helm"  # √ Manage installed Charts in your Kubernetes cluster, in the same way Helm does, through Terraform
      version = ">= 2.9.0"  # √ The latest version as of 15th May
    }
  }

  required_version = "~> 4.67.0"
}
