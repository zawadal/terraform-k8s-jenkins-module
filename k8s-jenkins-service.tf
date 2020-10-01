resource "kubernetes_service" "jenkins-service" {
  metadata {
    name = "jenkins-service"
  }
  spec {
    selector = {
      app = "jenkins"
    }
    session_affinity = "ClientIP"
    port {
      port        = 8080
      target_port = 8080
    }

    type = "NodePort"
  }
}