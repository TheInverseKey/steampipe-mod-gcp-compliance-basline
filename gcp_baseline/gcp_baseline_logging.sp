locals {
  gcp_baseline_common_tags = merge(local.gcp_baseline_logging_common_tags, {
   
  })
}

benchmark "gcp_baseline_logging" {
  title         = "Logging"
  documentation = file("./cis_v200/docs/cis_v200_1.md")
  children = [
    control.gcp_baseline_logging_cis_v200_2_1,
    control.gcp_baseline_logging_cis_v200_2_2,
    control.gcp_baseline_logging_cis_v200_2_3,
    control.gcp_baseline_logging_cis_v200_2_4,
    control.gcp_baseline_logging_cis_v200_2_5,
    control.gcp_baseline_logging_cis_v200_2_6,
    control.gcp_baseline_logging_cis_v200_2_7,
    control.gcp_baseline_logging_cis_v200_2_8,
    control.gcp_baseline_logging_cis_v200_2_9,
    control.gcp_baseline_logging_cis_v200_2_10,
    control.gcp_baseline_logging_cis_v200_2_11,
    control.gcp_baseline_logging_cis_v200_2_16
  ]

  tags = merge(local.gcp_baseline_logging_common_tags, {
    type = "Benchmark"
  })
}


control "gcp_baseline_logging_cis_v200_2_1" {
  title         = "2.1 Ensure that Cloud Audit Logging is configured properly"
  description   = "It is recommended that Cloud Audit Logging is configured to track all admin activities and read, write access to user data."
  query         = query.audit_logging_configured_for_all_service
  documentation = file("./cis_v200/docs/cis_v200_2_1.md")

  tags = merge(local.gcp_baseline_logging_common_tags, {
    cis_item_id = "2.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "GCP/Logging"
  })
}

control "gcp_baseline_logging_cis_v200_2_2" {
  title         = "2.2 Ensure that sinks are configured for all log entries"
  description   = "It is recommended to create a sink that will export copies of all the log entries. This can help aggregate logs from multiple projects and export them to a Security Information and Event Management (SIEM)."
  query         = query.logging_sink_configured_for_all_resource
  documentation = file("./cis_v200/docs/cis_v200_2_2.md")

  tags = merge(local.gcp_baseline_logging_common_tags, {
    cis_item_id = "2.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "GCP/Logging"
  })
}

control "gcp_baseline_logging_cis_v200_2_3" {
  title         = "2.3 Ensure that retention policies on log buckets are configured using Bucket Lock"
  description   = "Enabling retention policies on log buckets will protect logs stored in cloud storage buckets from being overwritten or accidentally deleted. It is recommended to set up retention policies and configure Bucket Lock on all storage buckets that are used as log sinks."
  query         = query.logging_bucket_retention_policy_enabled
  documentation = file("./cis_v200/docs/cis_v200_2_3.md")

  tags = merge(local.gcp_baseline_logging_common_tags, {
    cis_item_id = "2.3"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "GCP/Logging"
  })
}

control "gcp_baseline_logging_cis_v200_2_4" {
  title         = "2.4 Ensure log metric filter and alerts exist for project ownership assignments/changes"
  description   = "In order to prevent unnecessary project ownership assignments to users/service-accounts and further misuses of projects and resources, all roles/Owner assignments should be monitored. Members (users/Service-Accounts) with a role assignment to primitive role roles/Owner are project owners."
  query         = query.logging_metric_alert_project_ownership_assignment
  documentation = file("./cis_v200/docs/cis_v200_2_4.md")

  tags = merge(local.gcp_baseline_logging_common_tags, {
    cis_item_id = "2.4"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "GCP/Logging"
  })
}

control "gcp_baseline_logging_cis_v200_2_5" {
  title         = "2.5 Ensure that the log metric filter and alerts exist for Audit Configuration changes"
  description   = "Cloud audit logging records information includes the identity of the API caller, the time of the API call, the source IP address of the API caller, the request parameters, and the response elements returned by GCP services. Cloud audit logging provides a history of GCP API calls for an account, including API calls made via the console, SDKs, command-line tools, and other GCP services."
  query         = query.logging_metric_alert_audit_configuration_changes
  documentation = file("./cis_v200/docs/cis_v200_2_5.md")

  tags = merge(local.gcp_baseline_logging_common_tags, {
    cis_item_id = "2.5"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "GCP/Logging"
  })
}

control "gcp_baseline_logging_cis_v200_2_6" {
  title         = "2.6 Ensure that the log metric filter and alerts exist for Custom Role changes"
  description   = "It is recommended that a metric filter and alarm be established for changes to Identity and Access Management (IAM) role creation, deletion and updating activities."
  query         = query.logging_metric_alert_custom_role_changes
  documentation = file("./cis_v200/docs/cis_v200_2_6.md")

  tags = merge(local.gcp_baseline_logging_common_tags, {
    cis_item_id = "2.6"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "GCP/Logging"
  })
}

control "gcp_baseline_logging_cis_v200_2_7" {
  title         = "2.7 Ensure that the log metric filter and alerts exist for VPC Network Firewall rule changes"
  description   = "It is recommended that a metric filter and alarm be established for Virtual Private Cloud (VPC) Network Firewall rule changes."
  query         = query.logging_metric_alert_firewall_rule_changes
  documentation = file("./cis_v200/docs/cis_v200_2_7.md")

  tags = merge(local.gcp_baseline_logging_common_tags, {
    cis_item_id = "2.7"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "GCP/Logging"
  })
}

control "gcp_baseline_logging_cis_v200_2_8" {
  title         = "2.8 Ensure that the log metric filter and alerts exist for VPC network route changes"
  description   = "It is recommended that a metric filter and alarm be established for Virtual Private Cloud (VPC) network route changes."
  query         = query.logging_metric_alert_network_route_changes
  documentation = file("./cis_v200/docs/cis_v200_2_8.md")

  tags = merge(local.gcp_baseline_logging_common_tags, {
    cis_item_id = "2.8"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "GCP/Logging"
  })
}

control "gcp_baseline_logging_cis_v200_2_9" {
  title         = "2.9 Ensure that the log metric filter and alerts exist for VPC network changes"
  description   = "It is recommended that a metric filter and alarm be established for Virtual Private Cloud (VPC) network changes."
  query         = query.logging_metric_alert_network_changes
  documentation = file("./cis_v200/docs/cis_v200_2_9.md")

  tags = merge(local.gcp_baseline_logging_common_tags, {
    cis_item_id = "2.9"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "GCP/Logging"
  })
}

control "gcp_baseline_logging_cis_v200_2_10" {
  title         = "2.10 Ensure that the log metric filter and alerts exist for Cloud Storage IAM permission changes"
  description   = "It is recommended that a metric filter and alarm be established for Cloud Storage Bucket IAM changes."
  query         = query.logging_metric_alert_storage_iam_permission_changes
  documentation = file("./cis_v200/docs/cis_v200_2_10.md")

  tags = merge(local.gcp_baseline_logging_common_tags, {
    cis_item_id = "2.10"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "GCP/Logging"
  })
}

control "gcp_baseline_logging_cis_v200_2_11" {
  title         = "2.11 Ensure that the log metric filter and alerts exist for SQL instance configuration changes"
  description   = "It is recommended that a metric filter and alarm be established for SQL instance configuration changes."
  query         = query.logging_metric_alert_sql_instance_configuration_changes
  documentation = file("./cis_v200/docs/cis_v200_2_11.md")

  tags = merge(local.gcp_baseline_logging_common_tags, {
    cis_item_id = "2.11"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "GCP/Logging"
  })
}

control "gcp_baseline_logging_cis_v200_2_16" {
  title         = "2.16 Ensure Logging is enabled for HTTP(S) Load Balancer"
  description   = "Logging enabled on a HTTPS Load Balancer will show all network traffic and its destination."
  query         = query.compute_https_load_balancer_logging_enabled
  documentation = file("./cis_v200/docs/cis_v200_2_16.md")

  tags = merge(local.gcp_baseline_logging_common_tags, {
    cis_item_id = "2.16"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "GCP/Logging"
  })
}

