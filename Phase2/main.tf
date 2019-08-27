provider "kubernetes" {
  host = "https://"

  client_certificate     = "${file("~/.kube/client-cert.pem")}"
  client_key             = "${file("~/.kube/client-key.pem")}"
  cluster_ca_certificate = "${file("~/.kube/cluster-ca-cert.pem")}"
}

resource "kubernetes_namespace" "adrons-kuby-namespace" {
  metadata {
    name = "adrons-namespace"
  }
}
