variable "StorageAccountName" {
  type        = string
  description = "Storage account name"
}

variable "rglocation" {
  type        = string
  description = "location"
}

variable "rgname" {
  type        = string
  description = "rg name"
}

variable "env" {
  type = string

  validation {
    condition     = contains(["dev", "qa", "prod"], var.env)
    error_message = "Allowed values are: dev, qa, prod."
  }
}