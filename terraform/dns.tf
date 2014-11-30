
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

