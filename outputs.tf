output "pathpoint_flows_id" {
  description = "Map of id values across all pathpoint_flows, keyed the same as var.pathpoint_flows"
  value       = { for k, v in newrelic_pathpoint_flow.pathpoint_flows : k => v.id }
}
output "pathpoint_flows_account_id" {
  description = "Map of account_id values across all pathpoint_flows, keyed the same as var.pathpoint_flows"
  value       = { for k, v in newrelic_pathpoint_flow.pathpoint_flows : k => v.account_id }
}
output "pathpoint_flows_category" {
  description = "Map of category values across all pathpoint_flows, keyed the same as var.pathpoint_flows"
  value       = { for k, v in newrelic_pathpoint_flow.pathpoint_flows : k => v.category }
}
output "pathpoint_flows_description" {
  description = "Map of description values across all pathpoint_flows, keyed the same as var.pathpoint_flows"
  value       = { for k, v in newrelic_pathpoint_flow.pathpoint_flows : k => v.description }
}
output "pathpoint_flows_guid" {
  description = "Map of guid values across all pathpoint_flows, keyed the same as var.pathpoint_flows"
  value       = { for k, v in newrelic_pathpoint_flow.pathpoint_flows : k => v.guid }
}
output "pathpoint_flows_health_rollup" {
  description = "Map of health_rollup values across all pathpoint_flows, keyed the same as var.pathpoint_flows"
  value       = { for k, v in newrelic_pathpoint_flow.pathpoint_flows : k => v.health_rollup }
}
output "pathpoint_flows_kpis" {
  description = "Map of kpis values across all pathpoint_flows, keyed the same as var.pathpoint_flows"
  value       = { for k, v in newrelic_pathpoint_flow.pathpoint_flows : k => v.kpis }
}
output "pathpoint_flows_name" {
  description = "Map of name values across all pathpoint_flows, keyed the same as var.pathpoint_flows"
  value       = { for k, v in newrelic_pathpoint_flow.pathpoint_flows : k => v.name }
}
output "pathpoint_flows_refresh_interval" {
  description = "Map of refresh_interval values across all pathpoint_flows, keyed the same as var.pathpoint_flows"
  value       = { for k, v in newrelic_pathpoint_flow.pathpoint_flows : k => v.refresh_interval }
}
output "pathpoint_flows_stages" {
  description = "Map of stages values across all pathpoint_flows, keyed the same as var.pathpoint_flows"
  value       = { for k, v in newrelic_pathpoint_flow.pathpoint_flows : k => v.stages }
}
output "pathpoint_flows_version" {
  description = "Map of version values across all pathpoint_flows, keyed the same as var.pathpoint_flows"
  value       = { for k, v in newrelic_pathpoint_flow.pathpoint_flows : k => v.version }
}

