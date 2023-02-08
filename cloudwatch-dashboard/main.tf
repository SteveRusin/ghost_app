resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "cloud_dashboard"

  dashboard_body = file("${path.module}/dashboard_body.json")
}
