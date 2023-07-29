locals {
  gcp_baseline_common_tags = merge(local.gcp_baseline_organization_common_tags, {
   
  })
}

benchmark "gcp_baseline_organization" {
  title         = "Organization"
  documentation = file("./cis_v200/docs/cis_v200_1.md")
  children = [
    control.gcp_baseline_organization_cis_v200_1_16

  ]

  tags = merge(local.gcp_baseline_organization_common_tags, {
    type = "Benchmark"
  })
}

control "gcp_baseline_organization_cis_v200_1_16" {
  title         = "1.16 Ensure essential contacts is configured for Organization"
  description   = "It is recommended that Essential Contacts is configured to designate email addresses for Google Cloud services to notify of important technical or security information."
  query         = query.organization_essential_contacts_configured
  documentation = file("./cis_v200/docs/cis_v200_1_16.md")

  tags = merge(local.gcp_baseline_organization_common_tags, {
    cis_item_id = "1.16"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "GCP/Organization"
  })
}