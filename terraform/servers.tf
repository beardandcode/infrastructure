
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

