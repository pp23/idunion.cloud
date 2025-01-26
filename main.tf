data "kustomization_overlay" "cloud" {
  resources = ["overlays/${var.env}"]
  kustomize_options {
    enable_alpha_plugins = true
    enable_helm          = true
    helm_path            = var.helm_path
  }

  secret_generator {
    name      = "container-registry-credentials"
    namespace = "idunion"
    type      = "kubernetes.io/dockerconfigjson"
    literals = [
      ".dockerconfigjson=${file(var.idunion_dockerconfig_path)}",
    ]
  }
}

resource "kustomization_resource" "cloud_common" {
  for_each = data.kustomization_overlay.cloud.ids_prio[0]
  manifest = data.kustomization_overlay.cloud.manifests[each.value]
}

resource "kustomization_resource" "cloud" {
  for_each   = data.kustomization_overlay.cloud.ids_prio[1]
  manifest   = data.kustomization_overlay.cloud.manifests[each.value]
  depends_on = [kustomization_resource.cloud_common]
}
