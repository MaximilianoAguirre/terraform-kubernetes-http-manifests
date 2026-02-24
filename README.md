# Terraform module - HTTP k8s manifests

This module solves the need of applying manifests available at an HTTP server (like github) into a kubernetes cluster.

It makes the http query, parses the data and uses `kubectl_manifest` resources to apply the desired resources into a cluster.

Some validation is done on manifests, and `kubectl` provider is used to apply them in the server.

## Usage

```hcl
module "gateway_api_crds" {
    source = "MaximilianoAguirre/terraform-kubernetes-http-manifests"

    url               = "https://github.com/kubernetes-sigs/gateway-api/releases/download/${local.gateway_api_version}/experimental-install.yaml"
    server_side_apply = true
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.0 |
| <a name="requirement_http"></a> [http](#requirement_http) | >= 3.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement_kubectl) | >= 2.0 |



## Resources

| Name | Type |
|------|------|
| [kubectl_manifest.manifests](https://registry.terraform.io/providers/alekc/kubectl/latest/docs/resources/manifest) | resource |
| [http_http.manifests](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_url"></a> [url](#input_url) | The URL of the manifest to apply | `string` | n/a | yes |
| <a name="input_headers"></a> [headers](#input_headers) | The headers to send with the request | `map(string)` | <pre>{<br>  "Accept": "application/yaml"<br>}</pre> | no |
| <a name="input_insecure"></a> [insecure](#input_insecure) | Whether to allow insecure SSL connections | `bool` | `false` | no |
| <a name="input_request_body"></a> [request_body](#input_request_body) | The request body to send with the request | `string` | `null` | no |
| <a name="input_request_timeout_ms"></a> [request_timeout_ms](#input_request_timeout_ms) | The request timeout in milliseconds | `number` | `null` | no |
| <a name="input_server_side_apply"></a> [server_side_apply](#input_server_side_apply) | Whether to use server-side apply | `bool` | `false` | no |
| <a name="input_split_char"></a> [split_char](#input_split_char) | The character to split the manifest on | `string` | `"---"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_http_response"></a> [http_response](#output_http_response) | The response from the HTTP request |
| <a name="output_kubectl_manifests"></a> [kubectl_manifests](#output_kubectl_manifests) | The kubectl manifests resources |
| <a name="output_manifests"></a> [manifests](#output_manifests) | The manifests parsed from the HTTP response |
<!-- END_TF_DOCS -->