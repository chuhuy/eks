# Create sa service account on eks

```
# List Service Accounts
kubectl get sa -n kube-system

# Create ClusterRole, ClusterRoleBinding & ServiceAccount
kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/master/docs/examples/rbac-role.yaml

# List Service Accounts
kubectl get sa -n kube-system

# Describe Service Account alb-ingress-controller
kubectl describe sa alb-ingress-controller -n kube-system
```

# Create iam policy on aws iam

```
policy name:  ALBIngressControllerIAMPolicy
iam policy: https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/master/docs/examples/iam-policy.json

=> Add full permissions for ELB
Policy ARN: arn:aws:iam::825770460273:policy/ALBIngressControllerIAMPolicy
```

# Create IAM Role to assign to k8s sa

```
# Template
eksctl create iamserviceaccount \
    --region region-code \
    --name alb-ingress-controller \  #Note:  K8S Service Account Name that need to be bound to newly created IAM Role
    --namespace kube-system \
    --cluster prod \
    --attach-policy-arn arn:aws:iam::111122223333:policy/ALBIngressControllerIAMPolicy \
    --override-existing-serviceaccounts \
    --approve

# Replaced region, name, cluster and policy arn (Policy arn we took note in step-03)
eksctl create iamserviceaccount \
    --region ap-southeast-1 \
    --name alb-ingress-controller \
    --namespace kube-system \
    --cluster vietaws \
    --attach-policy-arn arn:aws:iam::825770460273:policy/ALBIngressControllerIAMPolicy \
    --override-existing-serviceaccounts \
    --approve --profile eks

# verify
# Get IAM Service Account
eksctl  get iamserviceaccount --cluster vietaws --profile eks

# Describe Service Account alb-ingress-controller
kubectl describe sa alb-ingress-controller -n kube-system
```

# Deploy ALB Ingress Controller

```
# Deploy ALB Ingress Controller
kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/master/docs/examples/alb-ingress-controller.yaml

# Verify Deployment
kubectl get deploy -n kube-system

```

You need to edit deployment

```
# Edit Deployment
kubectl edit deployment.apps/alb-ingress-controller -n kube-system

# Template file
spec:
  containers:
  - args:
      - --ingress-class=alb
      - --cluster-name=<cluster-name>
    image: docker.io/amazon/aws-alb-ingress-controller:v1.1.9


spec:
  containers:
          - args:
              - --ingress-class=alb
              - --cluster-name=vietaws
            image: docker.io/amazon/aws-alb-ingress-controller:v1.1.9
```

## Method 2

```
# guide: https://docs.aws.amazon.com/eks/latest/userguide/lbc-helm.html

# add eks-charts repo
helm repo add eks https://aws.github.io/eks-charts

# update your local to most recent charts
helm repo update

# install aws-load-balancer-controller

helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=vietaws \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller \
  --set region=ap-southeast-1

helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=vietaws \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller \
  --set region=ap-southeast-1 \
  --set vpcId=vpc-0178c4ab739679958 \
  --set image.repository=602401143452.dkr.ecr.ap-southeast-1.amazonaws.com/amazon/aws-load-balancer-controller


# uninstall
helm delete aws-load-balancer-controller -n kube-system


# verify
kubectl get deployment -n kube-system aws-load-balancer-controller

```

eksctl create iamserviceaccount \
 --cluster=vietaws \
 --namespace=kube-system \
 --name=aws-load-balancer-controller \
 --role-name=AmazonEKSLoadBalancerControllerRole \

--attach-policy-arn=arn:aws:iam::825770460273:policy/AWSLoadBalancerControllerIAMPolicy
\
 --approve --profile eks

helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
 -n kube-system \
 --set clusterName=vietaws \
 --set serviceAccount.create=false \
 --set serviceAccount.name=aws-load-balancer-controller
