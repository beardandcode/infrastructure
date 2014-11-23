
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



resource "digitalocean_droplet" "web" {
    name = "${var.domain_name}-web"
    region = "ams3"
    image = "6918990"
    size = "512mb"

    ssh_keys = ["${var.do_ssh_id}"]

    provisioner "local-exec" {
        command = "./tools/bootstrap_server.sh webservers ${digitalocean_droplet.web.ipv4_address}"
    }
}



resource "dnsimple_record" "root" {
    domain = "${var.domain_name}"
    name = ""
    value = "${digitalocean_droplet.web.ipv4_address}"
    type = "A"
    ttl = 3600
}

resource "dnsimple_record" "www" {
    domain = "${var.domain_name}"
    name = "www"
    value = "${digitalocean_droplet.web.ipv4_address}"
    type = "A"
    ttl = 3600
}

