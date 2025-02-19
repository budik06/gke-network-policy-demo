/*
Copyright 2018 Google LLC

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

/*
Variables for the creation of the cluster, bastion, subnet and network.
See https://www.terraform.io/docs/configuration/variables.html
*/

variable "project" {
  description = "The project in which to hold the components"
  type        = string
  default = "kinetic-scheme-258018"
}

variable "region" {
  description = "The region where the components should be created"
  type        = string
  default = "us-central1"
}

variable "zone" {
  description = "The zone in which to create the Kubernetes cluster. Must match the region"
  type        = string
  default = "us-central1-c"
}

/*
Optional Variables

Defaults will be used for these, if not overridden at runtime.
*/

variable "bastion_machine_type" {
  description = "The instance size to use for your bastion instance."
  type        = string
  default     = "f1-micro"
}

variable "bastion_hostname" {
  type    = string
  default = "gke-demo-bastion"
}

variable "bastion_tags" {
  description = "A list of tags applied to your bastion instance."
  type        = list(string)
  default     = ["bastion"]
}

variable "cluster_name" {
  description = "The name to give the new Kubernetes cluster."
  type        = string
  default     = "gke-demo-cluster"
}

variable "initial_node_count" {
  description = "The number of nodes initially provisioned in the cluster"
  type        = string
  default     = "3"
}

variable "ip_range" {
  description = "The CIDR from which to allocate cluster node IPs"
  type        = string
  default     = "10.0.96.0/22"
}

variable "master_cidr_block" {
  description = "The CIDR from which to allocate master IPs"
  type        = string
  default     = "10.0.90.0/28"
}

variable "node_machine_type" {
  description = "The instance to use for your node instances"
  type        = string
  default     = "n1-standard-1"
}

variable "node_tags" {
  description = "A list of tags applied to your node instances."
  type        = list(string)
  default     = ["poc"]
}

variable "secondary_ip_range" {
  // See https://cloud.google.com/kubernetes-engine/docs/how-to/alias-ips
  description = "The CIDR from which to allocate pod IPs for IP Aliasing."
  type        = string
  default     = "10.0.92.0/22"
}

variable "secondary_subnet_name" {
  // See https://cloud.google.com/kubernetes-engine/docs/how-to/alias-ips
  description = "The name to give the secondary subnet."
  type        = string
  default     = "kube-net-secondary-sub"
}

variable "subnet_name" {
  description = "The name to give the primary subnet"
  type        = string
  default     = "kube-net-subnet"
}

variable "vpc_name" {
  description = "The name to give the virtual network"
  type        = string
  default     = "kube-net"
}

variable "ssh_user_bastion" {
  description = "ssh user for bastion server"
  type        = string
  default     = "bastion"
}

variable "vpn_port" {
  description = "openvpn port for bastion server"
  type        = string
  default     = "1194"
}

variable "vpn_protocol" {
  description = "Openvpn protocol tcp or udp(default) for bastion server"
  type        = string
  default     = "udp"
}

