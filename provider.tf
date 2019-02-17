variable "do_token" {
    // do token
 //3bd467f30905492c8a802799b900057801d4fe47ef4b0ac19b0e0cb97e12c98d 
 // MD5 Hash 4e:c4:14:35:33:f7:36:ec:2f:98:77:14:5d:5f:29:0f
}
variable "pub_key" {
  
}
variable "pvt_key" {
  
}
variable "ssh_fingerprint" {
  
}
provider "digitalocean" {
  token = "${var.do_token}"
}
