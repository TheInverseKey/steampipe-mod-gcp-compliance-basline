locals {
  gcp_baseline_common_tags = merge(local.gcp_baseline_compute_common_tags, {
   
  })
}

benchmark "gcp_baseline_compute" {
  title         = "Compute"
  documentation = file("./cis_v200/docs/cis_v200_1.md")
  children = [
    control.gcp_baseline_compute_cis_v200_3_1,
    control.gcp_baseline_compute_cis_v200_3_2,
    control.gcp_baseline_compute_cis_v200_3_6,
    control.gcp_baseline_compute_cis_v200_3_7,
    control.gcp_baseline_compute_cis_v200_3_8,
    control.gcp_baseline_compute_cis_v200_4_1,
    control.gcp_baseline_compute_cis_v200_4_2,
    control.gcp_baseline_compute_cis_v200_4_3,
    control.gcp_baseline_compute_cis_v200_4_4,
    control.gcp_baseline_compute_cis_v200_4_5,
    control.gcp_baseline_compute_cis_v200_4_6,
    control.gcp_baseline_compute_cis_v200_4_7,
    control.gcp_baseline_compute_cis_v200_4_8,
    control.gcp_baseline_compute_cis_v200_4_9,
    control.gcp_baseline_compute_cis_v200_4_11,
    control.gcp_baseline_compute_cis_v200_4_12

  ]

  tags = merge(local.gcp_baseline_compute_common_tags, {
    type = "Benchmark"
  })
}

control "gcp_baseline_compute_cis_v200_3_1" {
  title         = "3.1 Ensure that the default network does not exist in a project"
  description   = "To prevent use of default network, a project should not have a default network."
  query         = query.compute_network_contains_no_default_network
  documentation = file("./cis_v200/docs/cis_v200_3_1.md")

  tags = merge(local.gcp_baseline_compute_common_tags, {
    cis_item_id = "3.1"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "GCP/Compute"
  })
}

control "gcp_baseline_compute_cis_v200_3_2" {
  title         = "3.2 Ensure legacy networks do not exist for a project"
  description   = "In order to prevent use of legacy networks, a project should not have a legacy network configured."
  query         = query.compute_network_contains_no_legacy_network
  documentation = file("./cis_v200/docs/cis_v200_3_2.md")

  tags = merge(local.gcp_baseline_compute_common_tags, {
    cis_item_id = "3.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "GCP/Compute"
  })
}


control "gcp_baseline_compute_cis_v200_3_6" {
  title         = "3.6 Ensure that SSH access is restricted from the internet"
  description   = "GCP Firewall Rules are specific to a VPC Network. Each rule either allows or denies traffic when its conditions are met. Its conditions allow the user to specify the type of traffic, such as ports and protocols, and the source or destination of the traffic, including IP addresses, subnets, and instances."
  query         = query.compute_firewall_rule_ssh_access_restricted
  documentation = file("./cis_v200/docs/cis_v200_3_6.md")

  tags = merge(local.gcp_baseline_compute_common_tags, {
    cis_item_id = "3.6"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "GCP/Compute"
  })
}

control "gcp_baseline_compute_cis_v200_3_7" {
  title         = "3.7 Ensure that RDP access is restricted from the Internet"
  description   = "GCP Firewall Rules are specific to a VPC Network. Each rule either allows or denies traffic when its conditions are met. Its conditions allow users to specify the type of traffic, such as ports and protocols, and the source or destination of the traffic, including IP addresses, subnets, and instances."
  query         = query.compute_firewall_rule_rdp_access_restricted
  documentation = file("./cis_v200/docs/cis_v200_3_7.md")

  tags = merge(local.gcp_baseline_compute_common_tags, {
    cis_item_id = "3.7"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "GCP/Compute"
  })
}

control "gcp_baseline_compute_cis_v200_3_8" {
  title         = "3.8 Ensure that VPC Flow Logs is enabled for every subnet in a VPC Network"
  description   = "Flow Logs is a feature that enables users to capture information about the IP traffic going to and from network interfaces in the organization's VPC Subnets. Once a flow log is created, the user can view and retrieve its data in Stackdriver Logging. It is recommended that Flow Logs be enabled for every business-critical VPC subnet."
  query         = query.compute_subnetwork_flow_log_enabled
  documentation = file("./cis_v200/docs/cis_v200_3_8.md")

  tags = merge(local.gcp_baseline_compute_common_tags, {
    cis_item_id = "3.8"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "GCP/Compute"
  })
}


control "gcp_baseline_compute_cis_v200_4_1" {
  title         = "4.1 Ensure that instances are not configured to use the default service account"
  description   = "It is recommended to configure your instance to not use the default Compute Engine service account because it has the Editor role on the project."
  query         = query.compute_instance_with_no_default_service_account
  documentation = file("./cis_v200/docs/cis_v200_4_1.md")

  tags = merge(local.gcp_baseline_compute_common_tags, {
    cis_item_id = "4.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "GCP/Compute"
  })
}

control "gcp_baseline_compute_cis_v200_4_2" {
  title         = "4.2 Ensure that instances are not configured to use the default service account with full access to all Cloud APIs"
  description   = "To support principle of least privileges and prevent potential privilege escalation it is recommended that instances are not assigned to default service account Compute Engine default service account with Scope Allow full access to all Cloud APIs."
  query         = query.compute_instance_with_no_default_service_account_with_full_access
  documentation = file("./cis_v200/docs/cis_v200_4_2.md")

  tags = merge(local.gcp_baseline_compute_common_tags, {
    cis_item_id = "4.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "GCP/Compute"
  })
}

control "gcp_baseline_compute_cis_v200_4_3" {
  title         = "4.3 Ensure 'Block Project-wide SSH keys' is enabled for VM instances"
  description   = "It is recommended to use Instance specific SSH key(s) instead of using common/shared project-wide SSH key(s) to access Instances."
  query         = query.compute_instance_block_project_wide_ssh_enabled
  documentation = file("./cis_v200/docs/cis_v200_4_3.md")

  tags = merge(local.gcp_baseline_compute_common_tags, {
    cis_item_id = "4.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "GCP/Compute"
  })
}

control "gcp_baseline_compute_cis_v200_4_4" {
  title         = "4.4 Ensure oslogin is enabled for a Project"
  description   = "Enabling OS login binds SSH certificates to IAM users and facilitates effective SSH certificate management."
  query         = query.compute_instance_oslogin_enabled
  documentation = file("./cis_v200/docs/cis_v200_4_4.md")

  tags = merge(local.gcp_baseline_compute_common_tags, {
    cis_item_id = "4.4"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "GCP/Compute"
  })
}

control "gcp_baseline_compute_cis_v200_4_5" {
  title         = "4.5 Ensure 'Enable connecting to serial ports' is not enabled for VM Instance"
  description   = "Interacting with a serial port is often referred to as the serial console, which is similar to using a terminal window, in that input and output is entirely in text mode and there is no graphical interface or mouse support."
  query         = query.compute_instance_serial_port_connection_disabled
  documentation = file("./cis_v200/docs/cis_v200_4_5.md")

  tags = merge(local.gcp_baseline_compute_common_tags, {
    cis_item_id = "4.5"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "GCP/Compute"
  })
}

control "gcp_baseline_compute_cis_v200_4_6" {
  title         = "4.6 Ensure that IP forwarding is not enabled on Instances"
  description   = "Compute Engine instance cannot forward a packet unless the source IP address of the packet matches the IP address of the instance. Similarly, GCP won't deliver a packet whose destination IP address is different than the IP address of the instance receiving the packet. However, both capabilities are required if you want to use instances to help route packets."
  query         = query.compute_instance_ip_forwarding_disabled
  documentation = file("./cis_v200/docs/cis_v200_4_6.md")

  tags = merge(local.gcp_baseline_compute_common_tags, {
    cis_item_id = "4.6"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "GCP/Compute"
  })
}

control "gcp_baseline_compute_cis_v200_4_7" {
  title         = "4.7 Ensure VM disks for critical VMs are encrypted with Customer-Supplied Encryption Keys (CSEK)"
  description   = "Customer-Supplied Encryption Keys (CSEK) are a feature in Google Cloud Storage and Google Compute Engine. If you supply your own encryption keys, Google uses your key to protect the Google-generated keys used to encrypt and decrypt your data. By default, Google Compute Engine encrypts all data at rest. Compute Engine handles and manages this encryption for you without any additional actions on your part. However, if you wanted to control and manage this encryption yourself, you can provide your own encryption keys."
  query         = query.compute_disk_encrypted_with_csk
  documentation = file("./cis_v200/docs/cis_v200_4_7.md")

  tags = merge(local.gcp_baseline_compute_common_tags, {
    cis_item_id = "4.7"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "GCP/Compute"
  })
}

control "gcp_baseline_compute_cis_v200_4_8" {
  title         = "4.8 Ensure Compute instances are launched with Shielded VM enabled"
  description   = "To defend against against advanced threats and ensure that the boot loader and firmware on your VMs are signed and untampered, it is recommended that Compute instances are launched with Shielded VM enabled."
  query         = query.compute_instance_shielded_vm_enabled
  documentation = file("./cis_v200/docs/cis_v200_4_8.md")

  tags = merge(local.gcp_baseline_compute_common_tags, {
    cis_item_id = "4.8"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "GCP/Compute"
  })
}

control "gcp_baseline_compute_cis_v200_4_9" {
  title         = "4.9 Ensure that Compute instances do not have public IP addresses"
  description   = "Compute instances should not be configured to have external IP addresses."
  query         = query.compute_instance_with_no_public_ip_addresses
  documentation = file("./cis_v200/docs/cis_v200_4_9.md")

  tags = merge(local.gcp_baseline_compute_common_tags, {
    cis_item_id = "4.9"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "GCP/Compute"
  })
}


control "gcp_baseline_compute_cis_v200_4_11" {
  title         = "4.11 Ensure that Compute instances have Confidential Computing enabled"
  description   = "Google Cloud encrypts data at-rest and in-transit, but customer data must be decrypted for processing. Confidential Computing is a breakthrough technology which encrypts data in-use—while it is being processed. Confidential Computing environments keep data encrypted in memory and elsewhere outside the central processing unit (CPU)."
  query         = query.compute_instance_confidential_computing_enabled
  documentation = file("./cis_v200/docs/cis_v200_4_11.md")

  tags = merge(local.gcp_baseline_compute_common_tags, {
    cis_item_id = "4.11"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "GCP/Compute"
  })
}

control "gcp_baseline_compute_cis_v200_4_12" {
  title         = "4.12 Ensure the Latest Operating System Updates Are Installed On Your Virtual Machines in All Projects"
  description   = "For the virtual machines where you manage the operating system in Infrastructure as a Service (IaaS), you are responsible for keeping these operating systems and programs up to date. There are multiple ways to manage updates yourself that would be difficult to fit into one recommendation. Check the CIS Benchmarks for each of your Operating Systems as well for potential solutions there. In this recommendation we will use a feature in Google Cloud via its VM manager API to manage updates called Operating System Patch Management (referred to OS Patch Management from here on out). This may requires installing the OS Config API if it is not already installed. Also if you install custom operating systems, they may not functionally support the local OS config agent required to gather operating system patch information and issue update commands. These update commands are the default Linux and Windows commands to install updates such as yum or apt. This feature allows for a central management to issue those commands. OS Patch management also does not host the updates itself, so your VMs will need to be public or be able to access the internet. This is not the only Patch Management solution available to your organization and you should weigh your needs before committing to using this."
  query         = query.manual_control
  documentation = file("./cis_v200/docs/cis_v200_4_12.md")

  tags = merge(local.gcp_baseline_compute_common_tags, {
    cis_item_id = "4.12"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "GCP/Compute"
  })
}
