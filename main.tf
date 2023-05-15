provider "kind" {
  provider   = "docker"
  kubeconfig = pathexpand("${path.module}/kind-config")
}

resource "kind_cluster" "demo" {
  name = "test"
  config = <<-EOF
        apiVersion: kind.x-k8s.io/v1alpha4
        kind: Cluster
        nodes:
        - role: control-plane
        - role: worker
        - role: worker
    EOF
}

resource "local_file" "kubeconfig" {
  content         = kind_cluster.demo.kubeconfig
  filename        = "${path.module}/kubeconfig"
  file_permission = "0400"
}