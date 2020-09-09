output "kibana_endpoint" {
  description = "The endpoint where Kibana is reachable on"
  value       = cloudfoundry_route.kibana.endpoint
}
