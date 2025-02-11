variable "location" {}
variable "vpc_name" {}
variable "auto_create_subnetworks" {}
variable "subnets" {
  type = list(object({
    name          = string
    ip_cidr_range = string
  }))
}
variable "firewall_data" {
  type = list(object({
    firewall_name      = string
    firewall_direction = string
    target_tags        = list(string)
    source_ranges      = list(string)
    allow_list = list(object({
      protocol = string
      ports    = list(string)
    }))
  }))
}
