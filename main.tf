data "oci_fleet_software_update_fsu_collections" "fleet_software_update_fsu_collections_lookup" {
  for_each = var.fleet_software_update_fsu_collections_lookup

  compartment_id = each.value.compartment_id
  display_name   = each.value.display_name
  state          = each.value.state
  type           = each.value.type

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

