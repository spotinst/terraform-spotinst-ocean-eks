terraform {
  # refs:
  #  - https://git.io/JT17e
  #  - https://git.io/JT1xM
  #  - https://git.io/JT1xA
  required_version = ">=0.12.15, <0.13"

  required_providers {
    spotinst   = ">= 1.27.0"
    kubernetes = ">= 2.0.1"
    aws        = ">= 3.3.0"
    random     = ">= 3.0.0"
  }
}
