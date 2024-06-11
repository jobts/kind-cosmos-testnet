variable "bitnami_repo" {
  description = "Bitnami helm repo"
  type = string
  default = "https://charts.bitnami.com/bitnami"
}

variable "prometheus_helm_repo" {
  description = "Prometheus helm repo"
  type = string
  default = "https://prometheus-community.github.io/helm-charts"
}

variable "testnet_host" {
  description = "Cosmos host"
  type = string
  default = "0.0.0.0"

}

variable "testnet_ports" {
  description = "Cosmos ports"
  type = map(string)
  default = {
    "api" = "1317"
    "grpc" = "9090"
    "rpc" = "26657"
  }
}

