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
      "yes | sudo apt-get update",
      "yes | sudo apt install apt-transport-https ca-certificates curl software-properties-common",
      "yes | curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
      "yes | sudo add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable'",
      "yes | sudo apt update",
      "yes | apt-cache policy docker-ce",
      "yes | sudo apt install docker-ce",
      "exit"
  ]
 }
}