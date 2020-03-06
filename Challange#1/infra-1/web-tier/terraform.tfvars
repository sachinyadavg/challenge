terragrunt = {
  terraform {
      source = "../../modules//ec2-instance"
       
         }
      include = {
                 path = "${find_in_parent_folders()}"
                 }
        dependencies = {
        paths = [
            "../vpc",
            "../subnets"
                 ]
    }
    }
#--------------------------------------------
# Data Parameters
#---------------------------
subnetids_tfstate_key = "infra-1/subnets/terraform.tfstate"

#---------------------------------------------
# Main configuration
#-----------------------------------------
ami_id = "ami-035966e8adab4aaad" #you can give manually or use filter along with data resource
instance_type = "t2.micro" # can be given it according to design
ssh_key_name = "" # you can define key here or in global tfvars in one dir up
root_volume_size = "8" # you can give custom size