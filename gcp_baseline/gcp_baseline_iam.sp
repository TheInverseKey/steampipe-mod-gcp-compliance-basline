locals {
  gcp_baseline_common_tags = merge(local.gcp_baseline_iam_common_tags, {
   
  })
}

benchmark "gcp_baseline_iam" {
  title         = "Identity and Access Management"
  documentation = file("./cis_v200/docs/cis_v200_1.md")
  children = [
    control.gcp_baseline_cis_v200_1_4,
    control.gcp_baseline_cis_v200_1_5,
    control.gcp_baseline_cis_v200_1_6,
    control.gcp_baseline_cis_v200_1_7,
    control.gcp_baseline_cis_v200_1_8,
    control.gcp_baseline_cis_v200_1_12,
    control.gcp_baseline_cis_v200_1_14,
    control.gcp_baseline_cis_v200_1_15
  ]

  tags = merge(local.gcp_baseline_iam_common_tags, {
    type = "Benchmark"
  })
}

control "gcp_baseline_cis_v200_1_4" {
  title         = "1.4 Ensure that there are only GCP-managed service account keys for each service account"
  description   = "User managed service accounts should not have user-managed keys."
  query         = query.iam_service_account_gcp_managed_key
  documentation = file("./cis_v200/docs/cis_v200_1_4.md")

  tags = merge(local.gcp_baseline_iam_common_tags, {
    cis_item_id = "1.4"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "GCP/IAM"
  })
}

control "gcp_baseline_cis_v200_1_5" {
  title         = "1.5 Ensure that Service Account has no Admin privileges"
  description   = "A service account is a special Google account that belongs to an application or a VM, instead of to an individual end-user. The application uses the service account to call the service's Google API so that users aren't directly involved. It's recommended not to use admin access for ServiceAccount."
  query         = query.iam_service_account_without_admin_privilege
  documentation = file("./cis_v200/docs/cis_v200_1_5.md")

  tags = merge(local.gcp_baseline_iam_common_tags, {
    cis_item_id = "1.5"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "GCP/IAM"
  })
}

control "gcp_baseline_cis_v200_1_6" {
  title         = "1.6 Ensure that IAM users are not assigned the Service Account User or Service Account Token Creator roles at project level"
  description   = "It is recommended to assign the Service Account User (iam.serviceAccountUser) and Service Account Token Creator (iam.serviceAccountTokenCreator) roles to a user for a specific service account rather than assigning the role to a user at project level."
  query         = query.iam_user_not_assigned_service_account_user_role_project_level
  documentation = file("./cis_v200/docs/cis_v200_1_6.md")

  tags = merge(local.gcp_baseline_iam_common_tags, {
    cis_item_id = "1.6"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "GCP/IAM"
  })
}

control "gcp_baseline_cis_v200_1_7" {
  title         = "1.7 Ensure user-managed/external keys for service accounts are rotated every 90 days or less"
  description   = "Service Account keys consist of a key ID (Private_key_Id) and Private key, which are used to sign programmatic requests users make to Google cloud services accessible to that particular service account. It is recommended that all Service Account keys are regularly rotated."
  query         = query.iam_service_account_key_age_90
  documentation = file("./cis_v200/docs/cis_v200_1_7.md")

  tags = merge(local.gcp_baseline_iam_common_tags, {
    cis_item_id = "1.7"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "GCP/IAM"
  })
}

control "gcp_baseline_cis_v200_1_8" {
  title         = "1.8 Ensure that Separation of duties is enforced while assigning service account related roles to users"
  description   = "It is recommended that the principle of 'Separation of Duties' is enforced while assigning service-account related roles to users."
  query         = query.iam_user_separation_of_duty_enforced
  documentation = file("./cis_v200/docs/cis_v200_1_8.md")

  tags = merge(local.gcp_baseline_iam_common_tags, {
    cis_item_id = "1.8"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "GCP/IAM"
  })
}

control "gcp_baseline_cis_v200_1_12" {
  title         = "1.12 Ensure API Keys Only Exist for Active Services"
  description   = "API Keys should only be used for services in cases where other authentication methods are unavailable. Unused keys with their permissions in tact may still exist within a project. Keys are insecure because they can be viewed publicly, such as from within a browser, or they can be accessed on a device where the key resides. It is recommended to use standard authentication flow instead."
  query         = query.manual_control
  documentation = file("./cis_v200/docs/cis_v200_1_12.md")

  tags = merge(local.gcp_baseline_iam_common_tags, {
    cis_item_id = "1.12"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "GCP/IAM"
  })
}

control "gcp_baseline_cis_v200_1_14" {
  title         = "1.14 Ensure API keys are restricted to only APIs that application needs access"
  description   = "API keys are insecure because they can be viewed publicly, such as from within a browser, or they can be accessed on a device where the key resides. It is recommended to restrict API keys to use (call) only APIs required by an application."
  query         = query.manual_control
  documentation = file("./cis_v200/docs/cis_v200_1_14.md")

  tags = merge(local.gcp_baseline_iam_common_tags, {
    cis_item_id = "1.14"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "GCP/IAM"
  })
}

control "gcp_baseline_cis_v200_1_15" {
  title         = "1.15 Ensure API keys are rotated every 90 days"
  description   = "It is recommended to rotate API keys every 90 days."
  query         = query.iam_api_key_age_90
  documentation = file("./cis_v200/docs/cis_v200_1_15.md")

  tags = merge(local.gcp_baseline_iam_common_tags, {
    cis_item_id = "1.15"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "GCP/IAM"
  })
}