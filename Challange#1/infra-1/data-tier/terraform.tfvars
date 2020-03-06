terragrunt = {
  terraform {
      source = "../../modules//rds"
       
         }
      include = {
                 path = "${find_in_parent_folders()}"
                 }
        dependencies = {
        paths = [
            "../app-tier"
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