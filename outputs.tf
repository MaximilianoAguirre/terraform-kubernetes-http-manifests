output "http_response" {
  value       = data.http.manifests
  description = "The response from the HTTP request"
}

output "manifests" {
  value       = local.manifests
  description = "The manifests parsed from the HTTP response"
}

output "kubectl_manifests" {
  value       = kubectl_manifest.manifests
  description = "The kubectl manifests resources"
}
