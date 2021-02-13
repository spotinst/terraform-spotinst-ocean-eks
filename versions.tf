terraform {
  # refs:
  #  - https://git.io/JtoPX
  #  - https://git.io/JT1xM
  #  - https://git.io/JT1xA
  required_version = ">= 0.12.26, != 0.13.0"

  required_providers {
    spotinst = {
      source  = "spotinst/spotinst"
      version = ">= 1.27.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0.0"
    }
  }
}
