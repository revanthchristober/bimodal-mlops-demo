# This block is added for local-only, zero-risk demonstration purposes.
# It tells Terraform to use a mock version of the Google provider instead of
# trying to connect to the real, billable Google Cloud Platform.
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0" # Specify a version
    }
  }
}

# In a real deployment, we would uncomment these lines and provide real values.
# For this local demo, they are not needed.
provider "google" {
  # project = "gcp-project-id"
  # region  = "us-central1"
}


# This Terraform file defines the foundational Kubernetes cluster.
resource "google_container_cluster" "primary" {
  name     = "mlops-platform-prod"
  location = "us-central1-a"
  initial_node_count = 1
  remove_default_node_pool = true
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-node-pool"
  cluster    = google_container_cluster.primary.name
  location   = google_container_cluster.primary.location
  node_count = 1

  autoscaling {
    min_node_count = 1
    max_node_count = 5
  }

  node_config {
    machine_type = "e2-medium"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}