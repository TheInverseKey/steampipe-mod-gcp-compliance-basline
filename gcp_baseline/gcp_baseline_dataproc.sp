locals {
  gcp_baseline_common_tags = merge(local.gcp_baseline_dataproc_common_tags, {
   
  })
}

benchmark "gcp_baseline_dataproc" {
  title         = "Dataproc"
  documentation = file("./cis_v200/docs/cis_v200_1.md")
  children = [
    control.gcp_baseline_dataproc_cis_v200_1_17
  ]

  tags = merge(local.gcp_baseline_dataproc_common_tags, {
    type = "Benchmark"
  })
}


control "gcp_baseline_dataproc_cis_v200_1_17" {
  title         = "1.17 Ensure that dataproc cluster is encrypted using customer-managed encryption key"
  description   = "When you use Dataproc, cluster and job data is stored on Persistent Disks (PDs) associated with the Compute Engine VMs in your cluster and in a Cloud Storage staging bucket. This PD and bucket data is encrypted using a Google-generated data encryption key (DEK) and key encryption key (KEK). The CMEK feature allows you to create, use, and revoke the key encryption key (KEK). Google still controls the data encryption key (DEK)."
  query         = query.dataproc_cluster_encryption_with_cmek
  documentation = file("./cis_v200/docs/cis_v200_1_17.md")

  tags = merge(local.gcp_baseline_dataproc_common_tags, {
    cis_item_id = "1.17"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "GCP/Dataproc"
  })
}
