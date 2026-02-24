#####################################################################################
# HTTP request
#####################################################################################
data "http" "manifests" {
  url                = var.url
  request_headers    = var.headers
  insecure           = var.insecure
  request_body       = var.request_body
  request_timeout_ms = var.request_timeout_ms
}

#####################################################################################
# Manifest parsing
#####################################################################################
locals {
  manifests = {
    for el in [
      for s in split(var.split_char, trimspace(data.http.manifests.response_body)) : yamldecode(trimspace(s)) if can(yamldecode(trimspace(s)))
    ] : el.metadata.name => yamlencode(el)
  }
}

#####################################################################################
# Kubectl resoruces
#####################################################################################
resource "kubectl_manifest" "manifests" {
  for_each          = local.manifests
  yaml_body         = each.value
  server_side_apply = var.server_side_apply
}
