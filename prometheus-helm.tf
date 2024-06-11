resource "helm_release" "prometheus" {
  name       = "kube-prometheus-stack"
  repository = var.prometheus_helm_repo
  chart      = "kube-prometheus-stack"
  version    = "60.0.2"
  namespace  = "kube-prometheus-stack"
  atomic = true
  lint = true
  create_namespace = true
  # set {
  #   name  = "service.type"
  #   value = "ClusterIP"
  # }
}
