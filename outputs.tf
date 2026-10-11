output "pathpoint_flows_id" {
  description = "Map of id values across all pathpoint_flows, keyed the same as var.pathpoint_flows except keys with no id are omitted"
  value       = { for k, v in newrelic_pathpoint_flow.pathpoint_flows : k => v.id if v.id != null && length(v.id) > 0 }
}
output "pathpoint_flows_account_id" {
  description = "Map of account_id values across all pathpoint_flows, keyed the same as var.pathpoint_flows except keys with no account_id are omitted"
  value       = { for k, v in newrelic_pathpoint_flow.pathpoint_flows : k => v.account_id if v.account_id != null }
}
output "pathpoint_flows_category" {
  description = "Map of category values across all pathpoint_flows, keyed the same as var.pathpoint_flows except keys with no category are omitted"
  value       = { for k, v in newrelic_pathpoint_flow.pathpoint_flows : k => v.category if v.category != null && length(v.category) > 0 }
}
output "pathpoint_flows_description" {
  description = "Map of description values across all pathpoint_flows, keyed the same as var.pathpoint_flows except keys with no description are omitted"
  value       = { for k, v in newrelic_pathpoint_flow.pathpoint_flows : k => v.description if v.description != null && length(v.description) > 0 }
}
output "pathpoint_flows_guid" {
  description = "Map of guid values across all pathpoint_flows, keyed the same as var.pathpoint_flows except keys with no guid are omitted"
  value       = { for k, v in newrelic_pathpoint_flow.pathpoint_flows : k => v.guid if v.guid != null && length(v.guid) > 0 }
}
output "pathpoint_flows_health_rollup" {
  description = "Map of health_rollup values across all pathpoint_flows, keyed the same as var.pathpoint_flows except keys with no health_rollup are omitted"
  value       = { for k, v in newrelic_pathpoint_flow.pathpoint_flows : k => v.health_rollup if v.health_rollup != null && length(v.health_rollup) > 0 }
}
output "pathpoint_flows_kpis" {
  description = "Map of kpis values across all pathpoint_flows, keyed the same as var.pathpoint_flows except keys with no kpis are omitted"
  value       = { for k, v in newrelic_pathpoint_flow.pathpoint_flows : k => v.kpis if v.kpis != null && length(v.kpis) > 0 }
}
output "pathpoint_flows_name" {
  description = "Map of name values across all pathpoint_flows, keyed the same as var.pathpoint_flows except keys with no name are omitted"
  value       = { for k, v in newrelic_pathpoint_flow.pathpoint_flows : k => v.name if v.name != null && length(v.name) > 0 }
}
output "pathpoint_flows_refresh_interval" {
  description = "Map of refresh_interval values across all pathpoint_flows, keyed the same as var.pathpoint_flows except keys with no refresh_interval are omitted"
  value       = { for k, v in newrelic_pathpoint_flow.pathpoint_flows : k => v.refresh_interval if v.refresh_interval != null && length(v.refresh_interval) > 0 }
}
output "pathpoint_flows_stages" {
  description = "Map of stages values across all pathpoint_flows, keyed the same as var.pathpoint_flows except keys with no stages are omitted"
  value       = { for k, v in newrelic_pathpoint_flow.pathpoint_flows : k => v.stages if v.stages != null && length(v.stages) > 0 }
}
output "pathpoint_flows_version" {
  description = "Map of version values across all pathpoint_flows, keyed the same as var.pathpoint_flows except keys with no version are omitted"
  value       = { for k, v in newrelic_pathpoint_flow.pathpoint_flows : k => v.version if v.version != null && length(v.version) > 0 }
}

