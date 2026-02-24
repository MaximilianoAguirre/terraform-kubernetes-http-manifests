terraform {
  required_version = ">= 1.0.0"

  required_providers {
    http    = { source = "hashicorp/http", version = ">= 3.0" }
    kubectl = { source = "alekc/kubectl", version = ">= 2.0" }
  }
}
