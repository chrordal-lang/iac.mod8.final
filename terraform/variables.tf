variable "environment" {
  type        = string
  description = "Miljø: dev, test eller prod"
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "norwayeast"
}

variable "project_name" {
  type        = string
  description = "Kort navn på prosjekt (brukes i ressursnavn)"
  default     = "chrismod8"
}

variable "account_tier" {
  type        = string
  description = "Storage account tier (Standard/Premium)"
}

variable "replication_type" {
  type        = string
  description = "Replication type (LRS/GRS etc.)"
}
