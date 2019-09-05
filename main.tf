provider "azurerm" {
  version = "=1.27.0"

  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

provider "kubernetes" {
  host                   = azurerm_kubernetes_cluster.test.kube_config[0].host
  username               = azurerm_kubernetes_cluster.test.kube_config[0].username
  password               = azurerm_kubernetes_cluster.test.kube_config[0].password
  client_certificate     = base64decode(azurerm_kubernetes_cluster.test.kube_config.0.client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.test.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.test.kube_config.0.cluster_ca_certificate)
}

output "lb_ip" {
  value = kubernetes_service.nginx.load_balancer_ingress[0].ip
}

output "lb_hostname" {
  value = kubernetes_service.nginx.load_balancer_ingress[0].hostname
}

output "location_long" {
  value = var.locationlong
}