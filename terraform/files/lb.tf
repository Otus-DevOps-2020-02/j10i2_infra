// instance group
resource "google_compute_instance_group" "reddit-app" {
  name      = "reddit-app"
  zone      = var.zone
  instances = google_compute_instance.app.*.self_link
  named_port {
    name = "puma"
    port = "9292"
  }
}
// health check
resource "google_compute_health_check" "health-check" {
  name = "health-check"
  http_health_check {
    port = 9292
  }
}
// backend service
resource "google_compute_backend_service" "backend-service" {
  name          = "backend-service"
  port_name     = "puma"
  protocol      = "HTTP"
  health_checks = [google_compute_health_check.health-check.self_link]
  backend {
    group = google_compute_instance_group.reddit-app.self_link
  }
}
// target proxy
resource "google_compute_target_http_proxy" "target-proxy" {
  name    = "target-proxy"
  url_map = google_compute_url_map.load-balancer.self_link
}
// URL map
resource "google_compute_url_map" "load-balancer" {
  name            = "load-balancer"
  default_service = google_compute_backend_service.backend-service.self_link
}
//forwarding rule
resource "google_compute_global_forwarding_rule" "forwarding-rule" {
  name       = "forwarding-rule"
  target     = google_compute_target_http_proxy.target-proxy.self_link
  port_range = "80-80"
}
