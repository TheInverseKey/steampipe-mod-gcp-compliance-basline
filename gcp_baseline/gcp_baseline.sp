locals {
  gcp_baseline_common_tags = merge(local.gcp_compliance_common_tags, {
    benchmark   = "gcp_baseline"
    cis_version = "v2.0.0"
  })
}

benchmark "gcp_baseline" {
  title         = "GCP Best Practices + CIS v2.0.0"
  description   = "The CIS Google Cloud Platform Foundations Security Benchmark covers foundational elements of Google Cloud Platform."
  documentation = file("./gcp_baseline/docs/gcp_baseline_overview.md")
  children = [
    benchmark.gcp_baseline_iam,
    benchmark.gcp_baseline_kms,
    benchmark.gcp_baseline_organization,
    benchmark.gcp_baseline_dataproc
    
  ]

  tags = merge(local.gcp_baseline_common_tags, {
    type = "Benchmark"
  })
}
