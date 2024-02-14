terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}
provider "kubernetes" {
  host = "https://127.0.0.1:35355"
}
resource "kubernetes_deployment" "test" {
  metadata {
    name      = "express-app"
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "express-app"
      }
    }
    template {
      metadata {
        labels = {
          app = "express-app"
        }
      }
      spec {
        container {
          image = "ismail1998/express-app:latest"
          name  = "express-app"
          port {
            container_port = 3000
          }
        }
      }
    }
  }
}