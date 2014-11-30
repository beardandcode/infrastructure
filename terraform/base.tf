
variable "do_token" {}
variable "do_ssh_id" {}

variable "dnsimple_email" {}
variable "dnsimple_token" {}

variable "domain_name" {}


provider "digitalocean" {
    token = "${var.do_token}"
}

provider "dnsimple" {
    token = "${var.dnsimple_token}"
    email = "${var.dnsimple_email}"
}

