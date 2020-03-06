terragrunt = {

    # Configure Terragrunt to automatically store tfstate files in an S3 bucket
    remote_state {
        backend = "s3"
        config {
            encrypt        = true
            bucket         = "" # Enter bucket name to save tf remote statefile 
            key            = "${path_relative_to_include()}/terraform.tfstate"
            region         = "eu-west-1"
            dynamodb_table = "test-infra-table"
        }
    }

    # Configure root level variables that all resources can inherit
    terraform {
        extra_arguments "generic" {
            commands = ["${get_terraform_commands_that_need_vars()}"]
            optional_var_files = [
                "${get_tfvars_dir()}/${find_in_parent_folders("global.tfvars", "ignore")}"
            ]
        }
    }
}