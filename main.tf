terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "0.5.1"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.30.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = "2.13.2"
    }
  }
}


# Local kubernetes cluster 

provider "kind" {
}

resource "kind_cluster" "default" {
  name = "kind-cluster"
  wait_for_ready = true
}


output "kind_cluster_name" {
  value = kind_cluster.default.name
  description = "Kind cluster name"
}

output "kind_cluster_config" {
  value = kind_cluster.default.kubeconfig_path
  description = "Kind cluster, config path"
}

# Kubernetes provider

provider "kubernetes" {
  config_path    =  "${kind_cluster.default.kubeconfig_path}"
  # config_context = "context"
}

# Helm Provider

provider "helm" {
  kubernetes {
    config_path    =  "${kind_cluster.default.kubeconfig_path}"
  }
}
