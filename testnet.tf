resource "kubernetes_namespace" "testnet" {
  metadata {
    name = "testnet"
  }
  depends_on = [kind_cluster.default]
}

resource "kubernetes_manifest" "testnet-svc" {
  manifest = yamldecode(
    templatefile(
      "./cosmos-sdk/service.yaml",
      { ports = var.testnet_ports }
  ))
  depends_on = [kind_cluster.default]
}

resource "kubernetes_manifest" "testnet-sts" {
  manifest = yamldecode(
      templatefile(
        "./cosmos-sdk/statefulset.yaml",
        { ports = var.testnet_ports,
          host = var.testnet_host
        }
      ))
  depends_on = [kind_cluster.default]
}
