resource "kubernetes_pod" "nginx" {
  metadata {
    name = "nginx-pod"
    labels = {
      App = "nginx"
    }
  }

  spec {
    container {
      image = "nginx:1.7.8"
      name = "nginx-ct"

      port {
        container_port = 80
      }
    }
  }
}
