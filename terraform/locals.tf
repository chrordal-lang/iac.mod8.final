locals {
  # Eks: chrismod8-rg-dev
  rg_name = "${var.project_name}-rg-${var.environment}"

  # Eks: chrismod8sadev  (lowercase + ingen '-')
  sa_name = lower(replace("${var.project_name}sa${var.environment}", "-", ""))
}
