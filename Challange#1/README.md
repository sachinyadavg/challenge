Author: Sachin Kumar </br>
------------------------------------------------------------------------------</br>

# Challenge#1> terragrunt plan-all </br>
# Challenge#1> terragrunt apply-all </br>

This solution can - deploy 3 tier architecture which includes- </br>
  i) VPC </br>
  ii) Subnets in VPC </br>
  iii) Web instances in available subnets - created in step ii </br>
  iv) ELB with instances attached, created in step iii </br>
  v) App tier instances </br>
  vi)RDS database </br>
This solution is basic setup and can be enhanced according to your requirements where other compenents - like route tables, security groups, security rules can be created and added as per requirement. </br>

PRE-REQUISITE</br>
------------------------------ </br>
Since terraform has complexity in handling dependency between modules - so I have used TERRAGRUNT. </br>
Terragrunt is a thin wrapper for Terraform that provides extra tools for working with multiple Terraform modules.</br>
https://terragrunt.gruntwork.io/ </br>
download and install - https://terragrunt.gruntwork.io/docs/getting-started/install/ <br>
</br>




