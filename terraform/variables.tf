variable "do_token" {
  description = "DO API token"
  type        = string
  sensitive   = true
}

variable "region" {
  default = "sfo3"
}
variable "k8s_node_count" {
  default = 1
}
variable "k8s_node_size" {
  default = "s-2vcpu-4gb"
}
