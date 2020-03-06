variable "ami_id" {
}

variable "instance_type" {

} 

variable "ssh_key_name" {
  }

variable "aws_region" {
    description = "Region to run the module"
    type        = "string"
    default     = ""
                }

variable "root_volume_size" {

}
variable "tfstate_bucket" {
  }
variable "subnetids_tfstate_key" {
          
}





