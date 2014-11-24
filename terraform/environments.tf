
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
    image = "ubuntu-14-04-x64"
    size = "512mb"

    ssh_keys = ["${var.do_ssh_id}"]
    user_data = "webservers"

    provisioner "local-exec" {
        command = "./tools/ansible/bootstrap_server.sh webservers ${digitalocean_droplet.web.ipv4_address}"
    }
}



resource "dnsimple_record" "root" {
    domain = "${var.domain_name}"
    name = ""
    value = "${digitalocean_droplet.web.ipv4_address}"
    type = "A"
    ttl = 3600
}

resource "dnsimple_record" "wildcard" {
    domain = "${var.domain_name}"
    name = "*"
    value = "${digitalocean_droplet.web.ipv4_address}"
    type = "A"
    ttl = 3600
}

resource "dnsimple_record" "fwstringer_root" {
    domain = "fwstringer.com"
    name = ""
    value = "${var.domain_name}"
    type = "ALIAS"
    ttl = 3600
}

resource "dnsimple_record" "fwstringer_www" {
    domain = "fwstringer.com"
    name = "www"
    value = "${var.domain_name}"
    type = "CNAME"
    ttl = 3600
}

resource "dnsimple_record" "alicepayne_root" {
    domain = "alicepayne.co.uk"
    name = ""
    value = "${var.domain_name}"
    type = "ALIAS"
    ttl = 3600
}

resource "dnsimple_record" "alicepayne_www" {
    domain = "alicepayne.co.uk"
    name = "www"
    value = "${var.domain_name}"
    type = "CNAME"
    ttl = 3600
}

