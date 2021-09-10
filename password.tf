resource "random_password" "admin_password" {
  length           = 16
  special          = true
  override_special = "_%!#$&*()-=_+[]"
}
