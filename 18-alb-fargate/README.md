# 1 - Create fargate profile

```
# Get list of Fargate Profiles in a cluster
eksctl get fargateprofile --cluster vietaws1 --profile eks

# Template
eksctl create fargateprofile --cluster <cluster_name> \
                             --name <fargate_profile_name> \
                             --namespace <kubernetes_namespace>


# Replace values
eksctl create fargateprofile --cluster vietaws5 \
                             --name fargate1 \
                             --namespace fargate-ns \
                             --profile eks

# Delete Fargate profile

eksctl delete fargateprofile --cluster vietaws1 \
--name fargate1 \
--profile eks
```
