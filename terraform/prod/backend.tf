terraform {
  backend "gcs" {
    bucket  = "storage-bucket-prodj10i2"
    prefix  = "terraform/state"
  }
}
