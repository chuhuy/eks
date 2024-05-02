📗 Guide:
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

1. Install tf

```
brew upgrade hashicorp/tap/terraform
brew install hashicorp/tap/terraform
brew update
brew upgrade hashicorp/tap/terraform

# Verify
terraform -help
terraform version

=> Terraform v1.8.2

terraform -help plan
```

2. Init tf

```
# Go to project folder - run one time for new project
terraform init
```

3. Working

```
# format code
terraform fmt

# check change
terraform plan

# deploy
terraform apply

# destroy tf
terraform apply -destroy

# destroy single resource
terraform destroy -target RESOURCE_TYPE.NAME

# list all resources
terraform state list

# apply single resource
terraform plan -target=aws_instance.myinstance
terraform apply -target=aws_instance.myinstance

terraform apply -target=aws_vpc.vpctf

# apply single resource using module
terraform plan -target=module.mymodule.aws_instance.myinstance
terraform apply -target=module.mymodule.aws_instance.myinstance
```
