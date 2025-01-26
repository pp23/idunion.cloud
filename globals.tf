terraform {
  required_providers {
    kustomization = {
      source  = "kbst/kustomization"
      version = "0.9.6"
    }
  }
}

provider "kustomization" {
  kubeconfig_path = var.kubeconfig
}
