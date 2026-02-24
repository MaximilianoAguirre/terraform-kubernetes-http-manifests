#####################################################################################
# HTTP configuration
#####################################################################################
variable "url" {
  description = "The URL of the manifest to apply"
  type        = string
}

variable "insecure" {
  description = "Whether to allow insecure SSL connections"
  type        = bool
  default     = false
}

variable "request_body" {
  description = "The request body to send with the request"
  type        = string
  default     = null
}

variable "request_timeout_ms" {
  description = "The request timeout in milliseconds"
  type        = number
  default     = null
}

variable "headers" {
  description = "The headers to send with the request"
  type        = map(string)
  default     = { Accept = "application/yaml" }
}

#####################################################################################
# Parser configuration
#####################################################################################
variable "split_char" {
  description = "The character to split the manifest on"
  type        = string
  default     = "---"
}

#####################################################################################
# Kubectl configuration
#####################################################################################
variable "server_side_apply" {
  type        = bool
  description = "Whether to use server-side apply"
  default     = false
}
