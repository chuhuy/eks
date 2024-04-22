# 0️⃣ - ✡️ Summary

1. Install Amazon EKS cluster with command line
2.

# 1️⃣ - Create Amazon EKS Cluster

- ☕️ It will take 10-15 minutes to create Amazon EKS Cluster Control plane. So,
  take a cup of coffee 😆

```
# Create Cluster
eksctl create cluster --name=eks-vietaws \
                      --region=ap-southeast-1 \
                      --zones=ap-southeast-1a,ap-southeast-1b \
                      --without-nodegroup

# Get List of clusters
eksctl get cluster
```

### create cluster with existing vpc

```
eksctl create cluster --name=eks-vietaws \
                      --region=ap-southeast-1 \
                      #--zones=ap-southeast-1a,ap-southeast-1b \
                      --vpc-from-kops-cluster vpc-018e29483ce154a50 \
                      --vpc-public-subnets=subnet-076c44811e399ab76,subnet-0c3e72a0400d8fb7e  \
                      --without-nodegroup --profile eks
```

# 2️⃣ - Create Amazon EC2 key pair for SSH

1. Go to **Amazon EC2**
2. Go to **Key pairs** and generate new key pair. For example: `eks-kp`

This keypair we will use it when creating the EKS NodeGroup. This will help us
to login to the EKS Worker Nodes using Terminal.

# 3️⃣ - Create Node Group

```
# Create Public Node Group
eksctl create nodegroup --cluster=eks-vietaws \
                       --region=ap-southeast-1 \
                       --name=ng1 \
                       --node-type=t3.medium \
                       --nodes=2 \
                       --nodes-min=2 \
                       --nodes-max=4 \
                       --node-volume-size=20 \
                       --ssh-access \
                       --ssh-public-key=eks-kp \
                       --managed \
                       --asg-access \
                       --external-dns-access \
                       --full-ecr-access \
                       --appmesh-access \
                       --alb-ingress-access
```

eksctl create cluster --name=everything \
 --region=ap-southeast-1 \
 --zones=ap-southeast-1a,ap-southeast-1b \
 --node-type=t3.medium \
 --nodes=2 \
 --nodes-min=2 \
 --nodes-max=4 \
 --node-volume-size=20 \
 --managed \
 --full-ecr-access \
 --appmesh-access \
 --asg-access \
 --external-dns-access --profile eks

# 4️⃣ - Delete

### List EKS Clusters

eksctl get clusters

### Capture Node Group name

eksctl get nodegroup --cluster=<clusterName>

eksctl get nodegroup --cluster=eks-vietaws

### Delete Node Group

eksctl delete nodegroup --cluster=<clusterName> --name=<nodegroupName>

eksctl delete nodegroup --cluster=eks-vietaws --name=ng1

### Delete Cluster

eksctl delete cluster <clusterName>

eksctl delete cluster eks-vietaws
