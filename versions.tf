terraform {
  required_version = ">= 0.13.1"

  required_providers {
    spotinst = {
      source  = "spotinst/spotinst"
      version = ">= 1.39.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.2.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.37.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.1.0"
    }
  }
}
