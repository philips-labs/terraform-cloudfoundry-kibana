variable "kibana_image" {
  type        = string
  description = "Kibana Docker image to use"
  default     = "docker.elastic.co/kibana/kibana:7.7.1"
}
variable "cf_org" {
  type        = string
  description = "The CF Org to deploy under"
}
variable "cf_space" {
  type        = string
  description = "The CF Space to deploy in"
}
variable "cf_domain" {
  type        = string
  description = "The CF domain to use for Grafana"
}
variable "name_postfix" {
  type        = string
  description = "The postfix string to append to the hostname, prevents namespace clashes"
}
variable "environment" {
  type        = map
  description = "Environment variables for Kibana app"
  default     = {}
}
variable "network_policies" {
  description = "The container-to-container network policies to create with Kibana as the source app"
  type = list(object({
    destination_app = string
    protocol        = string
    port            = string
  }))
  default = []
}
variable "memory" {
  type        = number
  description = "The amount of RAM to allocate for Kibana (MB)"
  default     = 2048
}
variable "disk" {
  type        = number
  description = "The amount of Disk space to allocate for Kibana (MB)"
  default     = 2048
}
variable "db_broker" {
  type        = string
  description = "The Database broker to use for requesting a PostgreSQL database"
  default     = "hsdp-rds"
}
variable "db_plan" {
  type        = string
  description = "The Database plan to use"
  default     = "postgres-micro-dev"
}
