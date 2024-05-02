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

# destroy
terraform apply -destroy
```
