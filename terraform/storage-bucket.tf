provider "google" {
  version = "~> 2.15"
  project = var.project


}

module "storage-bucket" {
  source  = "SweetOps/storage-bucket/google"
  version = "0.3.0"
location  = var.location
  # Имя поменяйте на другое
  name = "storage-bucket-prod_j10i2"
}

output storage-bucket_url {
  value = module.storage-bucket.url
}
