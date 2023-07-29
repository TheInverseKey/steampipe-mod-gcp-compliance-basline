locals {
  gcp_baseline_common_tags = merge(local.gcp_baseline_project_common_tags, {
   
  })
}

benchmark "gcp_baseline_project" {
  title         = "Project"
  documentation = file("./cis_v200/docs/cis_v200_1.md")
  children = [
    control.gcp_baseline_project_cis_v200_2_13,
    control.gcp_baseline_project_cis_v200_2_15
  ]

  tags = merge(local.gcp_baseline_project_common_tags, {
    type = "Benchmark"
  })
}



control "gcp_baseline_project_cis_v200_2_13" {
  title         = "2.13 Ensure Cloud Asset Inventory Is Enabled"
  description   = "GCP Cloud Asset Inventory is services that provides a historical view of GCP resources and IAM policies through a time-series database. The information recorded includes metadata on Google Cloud resources, metadata on policies set on Google Cloud projects or resources, and runtime information gathered within a Google Cloud resource."
  query         = query.project_service_cloudasset_api_enabled
  documentation = file("./cis_v200/docs/cis_v200_2_13.md")

  tags = merge(local.gcp_baseline_project_common_tags, {
    cis_item_id = "2.13"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "GCP/Project"
  })
}

control "gcp_baseline_project_cis_v200_2_15" {
  title         = "2.15 Ensure 'Access Approval' is 'Enabled'"
  description   = "GCP Access Approval enables you to require your organizations' explicit approval whenever Google support try to access your projects. You can then select users within your organization who can approve these requests through giving them a security role in IAM. All access requests display which Google Employee requested them in an email or Pub/Sub message that you can choose to Approve. This adds an additional control and logging of who in your organization approved/denied these requests."
  query         = query.project_access_approval_settings_enabled
  documentation = file("./cis_v200/docs/cis_v200_2_15.md")

  tags = merge(local.gcp_baseline_project_common_tags, {
    cis_item_id = "2.15"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "GCP/Project"
  })
}