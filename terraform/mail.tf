
resource "mailgun_domain" "default" {
    name = "${var.domain_name}"
    spam_action = "tag"
    smtp_password = "${var.smtp_password}"
}

