variable "region" {
  description = "AWS Deployment region.."
  default     = "us-west-1"
}

#### VPC Network
variable "vpc_cidr" {
  default = "192.168.0.0/16"
}

variable "public_cidr" {
  default = "192.168.0.0/24"
}

variable "ingress_ports_bastion" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [22, 80, 443]
}

variable "DATASOURCE_USERNAME" {
  default = "eschool"
}

variable "DATASOURCE_PASSWORD" {
  default = "b1dnijpesvseshesre"
}

variable "MYSQL_ROOT_PASSWORD" {
  default = "legme876FCTFEfg1"
}
