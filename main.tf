terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.4.3"
    }
  }
}

provider "random" {
  # Configuration options
}

resource "random_integer" "this" {
  min = var.min
  max = var.max
  depends_on = [
    time_sleep.wait_30_seconds
  ]
}

resource "time_sleep" "wait_30_seconds" {
  create_duration = "30s"
}


output "output" {
  value = random_integer.this.result
}

variable "min" {
    default = 1
}
variable "max" {
    default = 50000
}
