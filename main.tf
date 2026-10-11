resource "newrelic_pathpoint_flow" "pathpoint_flows" {
  for_each = var.pathpoint_flows

  name             = each.value.name
  account_id       = each.value.account_id
  category         = each.value.category
  description      = each.value.description
  health_rollup    = each.value.health_rollup
  refresh_interval = each.value.refresh_interval

  dynamic "kpis" {
    for_each = each.value.kpis != null ? each.value.kpis : []
    content {
      account_id  = kpis.value.account_id
      category    = kpis.value.category
      description = kpis.value.description
      name        = kpis.value.name
      query {
        from = kpis.value.query.from
        select {
          aggregation_type = kpis.value.query.select.aggregation_type
          alias            = kpis.value.query.select.alias
          attribute        = kpis.value.query.select.attribute
          threshold        = kpis.value.query.select.threshold
        }
        dynamic "time_window" {
          for_each = kpis.value.query.time_window != null ? [kpis.value.query.time_window] : []
          content {
            custom_range = time_window.value.custom_range
            dynamic "relative_range" {
              for_each = time_window.value.relative_range != null ? [time_window.value.relative_range] : []
              content {
                compare_against = relative_range.value.compare_against
                since           = relative_range.value.since
              }
            }
          }
        }
        where = kpis.value.query.where
      }
    }
  }

  dynamic "stages" {
    for_each = each.value.stages != null ? each.value.stages : []
    content {
      health_rollup = stages.value.health_rollup
      is_excluded   = stages.value.is_excluded
      dynamic "levels" {
        for_each = stages.value.levels != null ? stages.value.levels : []
        content {
          dynamic "steps" {
            for_each = levels.value.steps != null ? levels.value.steps : []
            content {
              dynamic "config" {
                for_each = steps.value.config != null ? [steps.value.config] : []
                content {
                  health_rollup   = config.value.health_rollup
                  threshold_type  = config.value.threshold_type
                  threshold_value = config.value.threshold_value
                }
              }
              dynamic "entity_search_query" {
                for_each = steps.value.entity_search_query != null ? [steps.value.entity_search_query] : []
                content {
                  is_excluded = entity_search_query.value.is_excluded
                  query       = entity_search_query.value.query
                }
              }
              is_excluded     = steps.value.is_excluded
              link            = steps.value.link
              name            = steps.value.name
              scoped_accounts = steps.value.scoped_accounts
              dynamic "signals" {
                for_each = steps.value.signals != null ? steps.value.signals : []
                content {
                  guid        = signals.value.guid
                  is_excluded = signals.value.is_excluded
                  name        = signals.value.name
                  type        = signals.value.type
                }
              }
            }
          }
        }
      }
      link = stages.value.link
      name = stages.value.name
      dynamic "related" {
        for_each = stages.value.related != null ? [stages.value.related] : []
        content {
          source = related.value.source
          target = related.value.target
        }
      }
      dynamic "stage_kpis" {
        for_each = stages.value.stage_kpis != null ? stages.value.stage_kpis : []
        content {
          account_id  = stage_kpis.value.account_id
          category    = stage_kpis.value.category
          description = stage_kpis.value.description
          name        = stage_kpis.value.name
          query {
            from = stage_kpis.value.query.from
            select {
              aggregation_type = stage_kpis.value.query.select.aggregation_type
              alias            = stage_kpis.value.query.select.alias
              attribute        = stage_kpis.value.query.select.attribute
              threshold        = stage_kpis.value.query.select.threshold
            }
            dynamic "time_window" {
              for_each = stage_kpis.value.query.time_window != null ? [stage_kpis.value.query.time_window] : []
              content {
                custom_range = time_window.value.custom_range
                dynamic "relative_range" {
                  for_each = time_window.value.relative_range != null ? [time_window.value.relative_range] : []
                  content {
                    compare_against = relative_range.value.compare_against
                    since           = relative_range.value.since
                  }
                }
              }
            }
            where = stage_kpis.value.query.where
          }
        }
      }
    }
  }
}

