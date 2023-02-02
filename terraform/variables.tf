variable "region" {
  type    = string 
  default = "eu-west-2"
}

variable "ami" {
  type    = string 
  default = "ami-0d09654d0a20d3ae2"
}

variable "public_key" {
  description = "ssh public key"
}