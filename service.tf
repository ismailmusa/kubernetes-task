resource "kubernetes_service" "test" {
  metadata {
    name      = "express-app"
  }
  spec {
    selector = {
      app = "express-app"
    }
    type = "NodePort"
    port {
      node_port   = 3000
      port        = 3000
      target_port = 3000
    }
  }
}