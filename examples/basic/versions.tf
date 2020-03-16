terraform {
  required_version = ">= 0.12.0"

  required_providers {
    aws        = ">= 2.52.0"
    spotinst   = ">= 1.14.0"
    local      = ">= 1.2"
    null       = ">= 2.1"
    template   = ">= 2.1"
    random     = ">= 2.1"
    kubernetes = ">= 1.11"
  }
}
