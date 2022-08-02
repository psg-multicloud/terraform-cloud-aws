resource "aws_s3_bucket" "bucket_1" {
  bucket = "patriciagois-remote-state"
 versioning {
    enabled = true
  }
  
}


 