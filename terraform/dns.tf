
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



resource "dnsimple_record" "mail_receiving_0" {
    domain = "${var.domain_name}"
    name = "@"
    value = "${mailgun_domain.default.receiving_records.0.value}."
    type = "${mailgun_domain.default.receiving_records.0.record_type}"
    ttl = 3600
}

resource "dnsimple_record" "mail_receiving_1" {
    domain = "${var.domain_name}"
    name = "@"
    value = "${mailgun_domain.default.receiving_records.1.value}."
    type = "${mailgun_domain.default.receiving_records.1.record_type}"
    ttl = 3600
}

resource "dnsimple_record" "mail_sending_0" {
    domain = "${var.domain_name}"
    name = ""
    value = "${mailgun_domain.default.sending_records.0.value}."
    type = "${mailgun_domain.default.sending_records.0.record_type}"
    ttl = 3600
}

resource "dnsimple_record" "mail_sending_1" {
    domain = "${var.domain_name}"
    name = "pic._domainkey"
    value = "${mailgun_domain.default.sending_records.1.value}."
    type = "${mailgun_domain.default.sending_records.1.record_type}"
    ttl = 3600
}

resource "dnsimple_record" "mail_sending_2" {
    domain = "${var.domain_name}"
    name = "email"
    value = "${mailgun_domain.default.sending_records.2.value}."
    type = "${mailgun_domain.default.sending_records.2.record_type}"
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

