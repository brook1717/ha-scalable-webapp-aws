resource "aws_kms_key" "main" {
  description             = "KMS key for database and storage encryption"
  deletion_window_in_days = 7
  enable_key_rotation     = true
}

resource "aws_kms_alias" "main" {
  name          = "alias/${var.name}-kms-key"
  target_key_id = aws_kms_key.main.key_id
}