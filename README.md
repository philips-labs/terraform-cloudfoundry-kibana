<img src="https://cdn.rawgit.com/hashicorp/terraform-website/master/content/source/assets/images/logo-hashicorp.svg" width="500px">

# terraform-cloudfoundry-kibana
Deploys a Kibana instance to Cloud foundry

# Contact / Getting help
andy.lo-a-foe@philips.com

# License
License is MIT

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| cloudfoundry | >= 0.1206.0 |

## Providers

| Name | Version |
|------|---------|
| cloudfoundry | >= 0.1206.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cf\_domain | The CF domain to use for Grafana | `string` | n/a | yes |
| cf\_org | The CF Org to deploy under | `string` | n/a | yes |
| cf\_space | The CF Space to deploy in | `string` | n/a | yes |
| db\_broker | The Database broker to use for requesting a PostgreSQL database | `string` | `"hsdp-rds"` | no |
| db\_plan | The Database plan to use | `string` | `"postgres-micro-dev"` | no |
| disk | The amount of Disk space to allocate for Kibana (MB) | `number` | `2048` | no |
| environment | Environment variables for Kibana app | `map` | `{}` | no |
| kibana\_image | Kibana Docker image to use | `string` | `"docker.elastic.co/kibana/kibana:7.7.1"` | no |
| memory | The amount of RAM to allocate for Kibana (MB) | `number` | `2048` | no |
| name\_postfix | The postfix string to append to the hostname, prevents namespace clashes | `string` | n/a | yes |
| network\_policies | The container-to-container network policies to create with Kibana as the source app | <pre>list(object({<br>    destination_app = string<br>    protocol        = string<br>    port            = string<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| kibana\_endpoint | The endpoint where Kibana is reachable on |
