# New resource for the storage bucket our application will use.
resource "google_storage_bucket" "example_bucket" {
  name     = "olayinka123isha-bucket"
  location = "US"

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}

