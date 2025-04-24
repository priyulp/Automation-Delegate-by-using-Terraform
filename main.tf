provider "http" {}

provider "kubernetes" {
  config_path = "~/.kube/config"  # Update path if you're using custom config
}

resource "http_request" "delegate_yaml" {
  method = "POST"
  url    = "https://app.harness.io/gateway/ng/api/delegates/yaml"

  request_headers = {
    "x-api-key"     = var.api_key
    "Content-Type"  = "application/json"
  }

  request_body = jsonencode({
    accountId          = var.account_id
    delegateName       = var.delegate_name
    identifier         = var.delegate_name
    orgIdentifier      = var.org_identifier
    projectIdentifier  = var.project_identifier
    type               = "KUBERNETES"
  })

  response_body_only = true
}

resource "local_file" "delegate_yaml" {
  content  = http_request.delegate_yaml.response_body
  filename = "${path.module}/delegate.yaml"
}

resource "null_resource" "apply_delegate" {
  depends_on = [local_file.delegate_yaml]

  provisioner "local-exec" {
    command = "kubectl apply -f ${local_file.delegate_yaml.filename} -n ${var.delegate_namespace}"
  }
}
