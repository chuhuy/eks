# Create ECR Repo

```
# Template
aws ecr create-repository --repository-name <repo-name --region <region-code>

# Sample
aws ecr create-repository --repository-name demo --region ap-southeast-1 --profile eks
```

# Login ECR

aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS
--password-stdin 825770460273.dkr.ecr.ap-southeast-1.amazonaws.com

docker build -t 825770460273.dkr.ecr.ap-southeast-1.amazonaws.com:latest .

docker push 825770460273.dkr.ecr.ap-southeast-1.amazonaws.com/demo:latest
