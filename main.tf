data "cloudfoundry_org" "org" {
  name = var.cf_org
}
data "cloudfoundry_space" "space" {
  org  = data.cloudfoundry_org.org.id
  name = var.cf_space
}

data "cloudfoundry_service" "rds" {
  name = var.db_broker
}

data "cloudfoundry_domain" "domain" {
  name = var.cf_domain
}

resource "cloudfoundry_app" "kibana" {
  name         = var.name_postfix == "" ? "kibana" : "kibana-${var.name_postfix}"
  space        = data.cloudfoundry_space.space.id
  memory       = var.memory
  disk_quota   = var.disk
  docker_image = var.kibana_image
  environment  = var.environment
  timeout      = 180

  routes {
    route = cloudfoundry_route.kibana.id
  }
}

resource "cloudfoundry_route" "kibana" {
  domain   = data.cloudfoundry_domain.domain.id
  space    = data.cloudfoundry_space.space.id
  hostname = var.name_postfix == "" ? "kibana" : "kibana-${var.name_postfix}"
}

resource "cloudfoundry_network_policy" "kibana" {
  count = length(var.network_policies) > 0 ? 1 : 0

  dynamic "policy" {
    for_each = [for p in var.network_policies : {
      destination_app = p.destination_app
      port            = p.port
      protocol        = p.protocol
    }]
    content {
      source_app      = cloudfoundry_app.kibana.id
      destination_app = policy.value.destination_app
      protocol        = policy.value.protocol == "" ? "tcp" : policy.value.protocol
      port            = policy.value.port
    }
  }
}
