provider "kind" {
  provider   = "docker"
  kubeconfig = pathexpand("${path.module}/kind-config")
}

resource "kind_cluster" "this" {
  name = "kind_cluster"
  config = <<-EOF
        apiVersion: kind.x-k8s.io/v1alpha4
        kind: Cluster
        nodes:
        - role: control-plane
        - role: worker
    EOF
}

resource "local_file" "kubeconfig" {
  content         = kind_cluster.this.kubeconfig
  filename        = "${path.module}/kind-config"
  file_permission = "0400"
}