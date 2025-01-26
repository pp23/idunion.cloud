data "kustomization_build" "cloud" {
  path  = "overlays/${var.env}"
  kustomize_options {
    enable_alpha_plugins = true
    enable_helm = true
    helm_path = var.helm_path
  }
}

resource "kustomization_resource" "cloud-common" {
  for_each  = data.kustomization_build.cloud.ids_prio[0]
  manifest  = data.kustomization_build.cloud.manifests[each.value]
}

resource "kustomization_resource" "cloud" {
  for_each  = data.kustomization_build.cloud.ids_prio[1]
  manifest  = data.kustomization_build.cloud.manifests[each.value]
  depends_on  = [kustomization_resource.cloud-common]
}
