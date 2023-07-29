locals {
  gcp_baseline_common_tags = merge(local.gcp_baseline_kms_common_tags, {
   
  })
}

benchmark "gcp_baseline_kms" {
  title         = "Identity and Access Management"
  documentation = file("./cis_v200/docs/cis_v200_1.md")
  children = [
    control.gcp_baseline_kms_cis_v200_1_9,
    control.gcp_baseline_kms_cis_v200_1_10,
    control.gcp_baseline_kms_cis_v200_1_11
  ]

  tags = merge(local.gcp_baseline_kms_common_tags, {
    type = "Benchmark"
  })
}


control "cis_v200_1_9" {
  title         = "1.9 Ensure that Cloud KMS cryptokeys are not anonymously or publicly accessible"
  description   = "It is recommended that the IAM policy on Cloud KMS cryptokeys should restrict anonymous and/or public access."
  query         = query.kms_key_not_publicly_accessible
  documentation = file("./cis_v200/docs/cis_v200_1_9.md")

  tags = merge(local.gcp_baseline_kms_common_tags, {
    cis_item_id = "1.9"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "GCP/KMS"
  })
}

control "cis_v200_1_10" {
  title         = "1.10 Ensure KMS encryption keys are rotated within a period of 90 days"
  description   = "Google Cloud Key Management Service stores cryptographic keys in a hierarchical structure designed for useful and elegant access control management. The format for the rotation schedule depends on the client library that is used. For the gcloud command-line tool, the next rotation time must be in ISO or RFC3339 format, and the rotation period must be in the form INTEGER[UNIT], where units can be one of seconds (s), minutes (m), hours (h) or days (d)."
  query         = query.kms_key_rotated_within_90_day
  documentation = file("./cis_v200/docs/cis_v200_1_10.md")

  tags = merge(local.gcp_baseline_kms_common_tags, {
    cis_item_id = "1.10"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "GCP/KMS"
  })
}

control "cis_v200_1_11" {
  title         = "1.11 Ensure that Separation of duties is enforced while assigning KMS related roles to users"
  description   = "It is recommended that the principle of 'Separation of Duties' is enforced while assigning KMS related roles to users."
  query         = query.kms_key_separation_of_duties_enforced
  documentation = file("./cis_v200/docs/cis_v200_1_11.md")

  tags = merge(local.gcp_baseline_kms_common_tags, {
    cis_item_id = "1.11"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "GCP/KMS"
  })
}
