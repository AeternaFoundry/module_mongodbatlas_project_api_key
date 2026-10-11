variable "project_api_keys" {
  description = <<EOT
Map of project_api_keys, attributes below
Required:
    - description
    - project_assignment (block):
        - project_id (required)
        - role_names (required)
EOT

  type = map(object({
    description = string
    project_assignment = list(object({
      project_id = string
      role_names = set(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.project_api_keys : (
        length(v.project_assignment) >= 1
      )
    ])
    error_message = "Each project_assignment list must contain at least 1 items"
  }
}

