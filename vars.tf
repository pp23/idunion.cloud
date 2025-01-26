variable "kubeconfig" {
  type = string
  description = "Path to the kube config file"
}

variable "env" {
  type = string
  description = "Deployment environment which are the overlays like 'development'"
}

variable "helm_path" {
  type = string
  description = "Path to the Helm binary"
}
