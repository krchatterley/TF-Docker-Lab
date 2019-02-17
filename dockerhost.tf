resource "digitalocean_droplet" "web" {
  image  = "ubuntu-18-04-x64"
  name   = "dockerhost"
  region = "nyc3"
  size   = "s-1vcpu-1gb"
  private_networking = true
  ssh_keys = [
         "${var.ssh_fingerprint}"
  ]

connection {
    user = "root"
    type = "ssh"
    private_key = "${file(var.pvt_key)}"
    timeout = "2m"
}

provisioner "remote-exec" {
  inline = [
      "export PATH=$PATH:/usr/bin",
      # install docker
      "sudo apt-get update",
      "sudo apt install apt-transport-https ca-certificates curl software-properties-common",
      "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
      "sudo add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable'",
      "sudo apt update",
      "apt-cache policy docker-ce",
      "sudo apt install docker-ce",
      "sudo systemctl status docker"
  ]
 }
}