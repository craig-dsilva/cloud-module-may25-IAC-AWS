resource "aws_secretsmanager_secret" "hotel-db-url" {
  name                    = "hotel-db-url"
  recovery_window_in_days = 0
}