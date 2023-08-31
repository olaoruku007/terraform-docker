terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

# variable "docker_container" {
#   type = string
# }

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx"
  keep_locally = false
}



resource "docker_image" "my_app" {
  name         = "sa07/my_app:1.0.1"
  keep_locally = false
}



resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"

  ports {
    internal = 80
    external = 8000
  }
}

resource "docker_container" "nne" {
  image = docker_image.my_app.image_id
  name  = "nne"

  ports {
    internal = 3000
    external = 1020
  }
}


