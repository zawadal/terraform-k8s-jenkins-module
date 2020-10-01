resource "kubernetes_deployment" "jenkins" {
  metadata {
    name = "jenkins"
    labels = {
      app = "jenkins"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "jenkins"
      }
    }

    template {
      metadata {
        labels = {
          app = "jenkins"
        }
      }

      spec {

        volume {
          name = "vol01"
          persistent_volume_claim {
            claim_name = "task-pv-claim"
          }
        }

        container {
          image = "jenkins/jenkins:lts"
          name  = "jenkins"
          port {
             container_port = 8080
          }
          resources {
            limits {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          volume_mount {
            mount_path = "/var/jenkins_home"
            name = "vol01"
          }
        }
      }
    }
  }
}