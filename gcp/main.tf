terraform {
  backend "gcs" {
    bucket  = "myplaybuckethere24"
    prefix  = "terraform/state" 
       
    # location = "us-central1"           
  }
}
resource "google_storage_bucket" "mygcp" {
    name = "somenewbuckehffhfhfhhf"
    location = "us-central1"
  
}
