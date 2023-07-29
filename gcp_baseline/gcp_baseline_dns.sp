locals {
  gcp_baseline_common_tags = merge(local.gcp_baseline_dns_common_tags, {
   
  })
}

benchmark "gcp_baseline_dns" {
  title         = "DNS"
  documentation = file("./cis_v200/docs/cis_v200_1.md")
  children = [
    control.gcp_baseline_logging_cis_v200_2_12,
    control.gcp_baseline_logging_cis_v200_3_3,
    control.gcp_baseline_logging_cis_v200_3_4,
    control.gcp_baseline_logging_cis_v200_3_5
  ]

  tags = merge(local.gcp_baseline_dns_common_tags, {
    type = "Benchmark"
  })
}
control "gcp_baseline_logging_cis_v200_2_12" {
  title         = "2.12 Ensure that Cloud DNS logging is enabled for all VPC networks"
  description   = "Cloud DNS logging records the queries from the name servers within your VPC to Stackdriver. Logged queries can come from Compute Engine VMs, GKE containers, or other GCP resources provisioned within the VPC."
  query         = query.compute_network_dns_logging_enabled
  documentation = file("./cis_v200/docs/cis_v200_2_12.md")

  tags = merge(local.gcp_baseline_dns_common_tags, {
    cis_item_id = "2.12"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "GCP/DNS"
  })
}

control "gcp_baseline_logging_cis_v200_3_3" {
  title         = "3.3 Ensure that DNSSEC is enabled for Cloud DNS"
  description   = "Cloud Domain Name System (DNS) is a fast, reliable and cost-effective domain name system that powers millions of domains on the internet. Domain Name System Security Extensions (DNSSEC) in Cloud DNS enables domain owners to take easy steps to protect their domains against DNS hijacking and man-in-the-middle and other attacks."
  query         = query.dns_managed_zone_dnssec_enabled
  documentation = file("./cis_v200/docs/cis_v200_3_3.md")

  tags = merge(local.gcp_baseline_dns_common_tags, {
    cis_item_id = "3.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "GCP/DNS"
  })
}

control "gcp_baseline_logging_cis_v200_3_4" {
  title         = "3.4 Ensure that RSASHA1 is not used for the key-signing key in Cloud DNS DNSSEC"
  description   = "DNSSEC algorithm numbers in this registry may be used in CERT RRs. Zone signing (DNSSEC) and transaction security mechanisms (SIG(0) and TSIG) make use of particular subsets of these algorithms. The algorithm used for key signing should be a recommended one and it should be strong."
  query         = query.dns_managed_zone_key_signing_not_using_rsasha1
  documentation = file("./cis_v200/docs/cis_v200_3_4.md")

  tags = merge(local.gcp_baseline_dns_common_tags, {
    cis_item_id = "3.4"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "GCP/DNS"
  })
}

control "gcp_baseline_logging_cis_v200_3_5" {
  title         = "3.5 Ensure that RSASHA1 is not used for the zone-signing key in Cloud DNS DNSSEC"
  description   = "DNSSEC algorithm numbers in this registry may be used in CERT RRs. Zone signing (DNSSEC) and transaction security mechanisms (SIG(0) and TSIG) make use of particular subsets of these algorithms. The algorithm used for key signing should be a recommended one and it should be strong."
  query         = query.dns_managed_zone_zone_signing_not_using_rsasha1
  documentation = file("./cis_v200/docs/cis_v200_3_5.md")

  tags = merge(local.gcp_baseline_dns_common_tags, {
    cis_item_id = "3.5"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "GCP/DNS"
  })
}
