include: "//@{CONFIG_PROJECT_NAME}/kbc_organization.view"

view: kbc_organization {
  label: "KBC Organization"
  extends: [kbc_organization_config]
}

view: kbc_organization_core {
  sql_table_name: @{SCHEMA_NAME}.KBC_ORGANIZATION ;;

  dimension: kbc_organization_id {
    label: "KBC Organization ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."KBC_ORGANIZATION_ID" ;;
  }

  dimension: kbc_organization {
    label: "KBC Organization"
    type: string
    sql: ${TABLE}."KBC_ORGANIZATION" ;;
  }

  dimension_group: kbc_organization_created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."KBC_ORGANIZATION_CREATED_AT" ;;
  }

  measure: count {
    type: count
    drill_fields: [kbc_organization, kbc_organization_id, kbc_project.count]
  }
}
