locals {
  gcp_baseline_common_tags = merge(local.local.gcp_baseline_storage_common_tags, {
    cis_section_id = "5"
  })
}

benchmark "gcp_baseline_storage" {
  title         = "Storage"
  documentation = file("./cis_v200/docs/cis_v200_5.md")
  children = [
    control.gcp_baseline_storage_cis_v200_5_1,
    control.gcp_baseline_storage_cis_v200_5_2
  ]

  tags = merge(local.gcp_baseline_storage_common_tags, {
    type    = "Benchmark"
    service = "GCP/Storage"
  })
}

control "gcp_baseline_storage_cis_v200_5_1" {
  title         = "5.1 Ensure that Cloud Storage bucket is not anonymously or publicly accessible"
  description   = "It is recommended that IAM policy on Cloud Storage bucket does not allows anonymous or public access."
  query         = query.storage_bucket_not_publicly_accessible
  documentation = file("./cis_v200/docs/cis_v200_5_1.md")

  tags = merge(local.gcp_baseline_storage_common_tags, {
    cis_item_id = "5.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "GCP/Storage"
  })
}

control "gcp_baseline_storage_cis_v200_5_2" {
  title         = "5.2 Ensure that Cloud Storage buckets have uniform bucket-level access enabled"
  description   = "It is recommended that uniform bucket-level access is enabled on Cloud Storage buckets."
  query         = query.storage_bucket_uniform_access_enabled
  documentation = file("./cis_v200/docs/cis_v200_5_2.md")

  tags = merge(local.gcp_baseline_storage_common_tags, {
    cis_item_id = "5.2"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "GCP/Storage"
  })
}
