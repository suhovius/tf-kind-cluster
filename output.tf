output "kubeconfig" {
  value       = kind_cluster.demo.kubeconfig
  description = "The path to the kubeconfig file"
}