resource "random_integer" "bucket_id" {    
    min = 1
    max = 5

}
resource "aws_s3_bucket" "tf_backend" {
    bucket = "${var.project_name}-backend-${random_integer.bucket_id.result}"
    acl = "private"
    force_destroy = true
    tags = {
        Name = "tf_backend_state"
    }
  
}