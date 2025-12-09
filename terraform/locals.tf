locals {
  rg_name              = "${var.project_name}-rg-${var.environment}"
  storage_account_name = "${var.project_name}sa${var.environment}"
}
