module "ocean-eks" {
  source = "../.."

  # Credentials.
  spotinst_token   = var.spotinst_token
  spotinst_account = var.spotinst_account
}
