variable "account_id" {
  description = "Harness Account ID"
  type        = string
}

variable "api_key" {
  description = "Harness API Key"
  type        = string
  sensitive   = true
}

variable "delegate_name" {
  description = "Name for the Harness Delegate"
  type        = string
  default     = "auto-k8s-delegate"
}

variable "delegate_namespace" {
  description = "Kubernetes namespace where the delegate will be installed"
  type        = string
  default     = "harness-delegate"
}

variable "org_identifier" {
  description = "Harness Org Identifier"
  type        = string
  default     = "default"
}

variable "project_identifier" {
  description = "Harness Project Identifier"
  type        = string
  default     = "default_project"
}
