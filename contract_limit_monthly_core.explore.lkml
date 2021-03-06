explore: contract_limit_monthly_core {
  hidden: yes
  extension: required

  join: usage_metric {
    type: left_outer
    sql_on: ${contract_limit_monthly.usage_metric_id} = ${usage_metric.usage_metric_id} ;;
    relationship: many_to_one
  }
}
