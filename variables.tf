variable "pathpoint_flows" {
  description = <<EOT
Map of pathpoint_flows, attributes below
Required:
    - name
Optional:
    - account_id
    - category
    - description
    - health_rollup
    - refresh_interval
    - kpis (block):
        - account_id (optional)
        - category (optional)
        - description (optional)
        - name (required)
        - query (required, block):
            - from (required)
            - select (required, block):
                - aggregation_type (required)
                - alias (optional)
                - attribute (optional)
                - threshold (optional)
            - time_window (optional, block):
                - custom_range (optional)
                - relative_range (optional, block):
                    - compare_against (optional)
                    - since (required)
            - where (optional)
    - stages (block):
        - health_rollup (optional)
        - is_excluded (optional)
        - levels (optional, block):
            - steps (optional, block):
                - config (optional, block):
                    - health_rollup (optional)
                    - threshold_type (optional)
                    - threshold_value (optional)
                - entity_search_query (optional, block):
                    - is_excluded (optional)
                    - query (required)
                - is_excluded (optional)
                - link (optional)
                - name (required)
                - scoped_accounts (optional)
                - signals (optional, block):
                    - guid (required)
                    - is_excluded (optional)
                    - name (optional)
                    - type (optional)
        - link (optional)
        - name (required)
        - related (optional, block):
            - source (optional)
            - target (optional)
        - stage_kpis (optional, block):
            - account_id (optional)
            - category (optional)
            - description (optional)
            - name (required)
            - query (required, block):
                - from (required)
                - select (required, block):
                    - aggregation_type (required)
                    - alias (optional)
                    - attribute (optional)
                    - threshold (optional)
                - time_window (optional, block):
                    - custom_range (optional)
                    - relative_range (optional, block):
                        - compare_against (optional)
                        - since (required)
                - where (optional)
EOT

  type = map(object({
    name             = string
    account_id       = optional(number)
    category         = optional(string)
    description      = optional(string)
    health_rollup    = optional(string)
    refresh_interval = optional(string)
    kpis = optional(list(object({
      account_id  = optional(number)
      category    = optional(string)
      description = optional(string)
      name        = string
      query = object({
        from = string
        select = object({
          aggregation_type = string
          alias            = optional(string)
          attribute        = optional(string)
          threshold        = optional(number)
        })
        time_window = optional(object({
          custom_range = optional(string)
          relative_range = optional(object({
            compare_against = optional(string)
            since           = string
          }))
        }))
        where = optional(string)
      })
    })))
    stages = optional(list(object({
      health_rollup = optional(string)
      is_excluded   = optional(bool)
      levels = optional(list(object({
        steps = optional(list(object({
          config = optional(object({
            health_rollup   = optional(string)
            threshold_type  = optional(string)
            threshold_value = optional(number)
          }))
          entity_search_query = optional(object({
            is_excluded = optional(bool)
            query       = string
          }))
          is_excluded     = optional(bool)
          link            = optional(string)
          name            = string
          scoped_accounts = optional(list(number))
          signals = optional(list(object({
            guid        = string
            is_excluded = optional(bool)
            name        = optional(string)
            type        = optional(string)
          })))
        })))
      })))
      link = optional(string)
      name = string
      related = optional(object({
        source = optional(bool)
        target = optional(bool)
      }))
      stage_kpis = optional(list(object({
        account_id  = optional(number)
        category    = optional(string)
        description = optional(string)
        name        = string
        query = object({
          from = string
          select = object({
            aggregation_type = string
            alias            = optional(string)
            attribute        = optional(string)
            threshold        = optional(number)
          })
          time_window = optional(object({
            custom_range = optional(string)
            relative_range = optional(object({
              compare_against = optional(string)
              since           = string
            }))
          }))
          where = optional(string)
        })
      })))
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.pathpoint_flows : (
        v.stages == null || (length(v.stages) <= 50)
      )
    ])
    error_message = "Each stages list must contain at most 50 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.pathpoint_flows : (
        v.stages == null || alltrue([for item in v.stages : (item.levels == null || (length(item.levels) <= 50))])
      )
    ])
    error_message = "Each levels list must contain at most 50 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.pathpoint_flows : (
        v.stages == null || alltrue([for item in v.stages : (item.levels == null || alltrue([for item in item.levels : (item.steps == null || (length(item.steps) <= 50))]))])
      )
    ])
    error_message = "Each steps list must contain at most 50 items"
  }
  # Note: 9 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

