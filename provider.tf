provider "google" {
  credentials = file("cloudchallenge-key.json")
  project     = "cloudchallenge-401416"
  region      = "europe-central2"
}

# GCP beta provider
provider "google-beta" {
  credentials = file("cloudchallenge-key.json")
  project     = "cloudchallenge-401416"
  region      = "europe-central2"
}
