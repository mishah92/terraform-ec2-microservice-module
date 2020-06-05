output "user_data" {
  value = module.docker_compose_usr_data.user_data
}

output "cloud_init" {
  value = module.docker_compose_usr_data.cloud_init
}

output "app_url" {
  value = module.app_cluster.app_url
}

output "app_alb_dns" {
  value = module.app_cluster.app_alb_dns
}