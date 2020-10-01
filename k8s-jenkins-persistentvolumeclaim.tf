resource "kubernetes_persistent_volume_claim" "task-pv-claim" {
  metadata {
    name = "task-pv-claim"
  }
  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "10Gi"
      }
    }
    volume_name = "pv0001"
    storage_class_name = "slow"
  }
}