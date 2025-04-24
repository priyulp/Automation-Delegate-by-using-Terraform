output "delegate_yaml_file" {
  description = "Path to the generated Harness delegate YAML file"
  value       = local_file.delegate_yaml.filename
}
