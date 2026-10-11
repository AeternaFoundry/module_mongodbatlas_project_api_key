resource "mongodbatlas_project_api_key" "project_api_keys" {
  for_each = var.project_api_keys

  description = each.value.description

  dynamic "project_assignment" {
    for_each = each.value.project_assignment
    content {
      project_id = project_assignment.value.project_id
      role_names = project_assignment.value.role_names
    }
  }
}

