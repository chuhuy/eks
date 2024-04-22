# 📗 Topics

1. Create Deployment
2. Scale Deployment
3. Expose Deployment as Service
4. Update Deployment
5. Rollback Deployment
6. Rolling Restarts
7. Pause & Resume Deployments
8. Canary Deployments

### 💡 Keynotes:

- Create a **Deployment** will roll-out a **ReplicaSet** automatically

# 1️⃣ Create Deployment

```
# Create Deployment
kubectl create deployment <deployment-name> --image=<container-image>
kubectl create deployment vietdeploy1 --image=vietaws/eks:v1
# Output: deployment.apps/vietdeploy1 created

# Verify Deployment
kubectl get deployments
kubectl get deploy

# Describe Deployment
kubectl describe deployment <deployment-name>
kubectl describe deployment vietdeploy1

# Verify ReplicaSet
kubectl get rs

# Verify Pod
kubectl get pods
```

# 2️⃣ Scale Deployment

```
# Scale Up the Deployment
kubectl scale --replicas=10 deployment/<deployment-name>
kubectl scale --replicas=10 deployment/vietdeploy1
# Output: deployment.apps/vietdeploy1 scaled

# Verify Deployment
kubectl get deploy

# Verify ReplicaSet
kubectl get rs

# Verify Pods
kubectl get pods

# Scale Down the Deployment
kubectl scale --replicas=5 deployment/vietdeploy1
kubectl get deploy

# Verify Pods
kubectl get pods
```

# 3️⃣ Expose Deployment as a Service

```
# Expose Deployment as a Service
kubectl expose deployment <deployment-name>  --type=NodePort --port=8080 --name=<service-name>
kubectl expose deployment vietdeploy1 --type=NodePort --port=8080 --name=service1
# Output: service/service1 exposed

# Get Service Info
kubectl get svc
Observation: Make a note of port which starts with 3 (Example: 80:3xxxx/TCP). Capture the port 3xxxx and use it in application URL below.

# Get Public IP of Worker Nodes
kubectl get nodes -owide
Observation: Make a note of "EXTERNAL-IP" if your Kubernetes cluster is setup on Amazon EKS.
```

**Pod Output:**

```
NAME                           READY   STATUS    RESTARTS   AGE
vietdeploy1-6867597758-767b8   1/1     Running   0          63s
vietdeploy1-6867597758-9rckw   1/1     Running   0          63s
vietdeploy1-6867597758-cmsz4   1/1     Running   0          2m9s
vietdeploy1-6867597758-w9dtt   1/1     Running   0          63s
vietdeploy1-6867597758-zr89h   1/1     Running   0          63s
```

Website:

<img src="../images/img4.png" alt="vietaws deployment k8s" style="width: 300px;"/>

# 4️⃣ Update Deployment

```
# Get Container Name from current deployment
kubectl get deployment vietdeploy1 -o yaml
# Output Container Name: eks
# Output Container Image: vietaws/eks:v1

# Update Deployment to Version 2
kubectl set image deployment/<deployment-name> <container-name>=<container-image>
kubectl set image deployment/vietdeploy1 eks=vietaws/eks:v2
```

### 🔑 Before

Deployment

```
kubectl get deployments

NAME          READY   UP-TO-DATE   AVAILABLE   AGE
vietdeploy1   5/5     5            5           21m
```

ReplicaSet

```
kubectl get rs

NAME                     DESIRED   CURRENT   READY   AGE
vietdeploy1-5fd8d5c7cb   5         5         5       2m54s
```

Pods

```
kubectl get pods

NAME                           READY   STATUS    RESTARTS   AGE
vietdeploy1-5fd8d5c7cb-fjzhd   1/1     Running   0          3m22s
vietdeploy1-5fd8d5c7cb-gjglv   1/1     Running   0          3m22s
vietdeploy1-5fd8d5c7cb-lmzvg   1/1     Running   0          3m23s
vietdeploy1-5fd8d5c7cb-qf9ts   1/1     Running   0          3m23s
vietdeploy1-5fd8d5c7cb-tbnq9   1/1     Running   0          3m21s
```

### 💎 After

✅ ReplicaSet

```
kubectl get rs

NAME                     DESIRED   CURRENT   READY   AGE
vietdeploy1-5fd8d5c7cb   0         0         0       5m43s
vietdeploy1-7bb4b549bf   5         5         5       48s
```

🌈 New Pods go from OLD ReplicaSet `vietdeploy1-5fd8d5c7cb` to NEW ReplicaSet
`vietdeploy1-7bb4b549bf`

✅ Pods

```
kubectl get pods

NAME                           READY   STATUS    RESTARTS   AGE
vietdeploy1-7bb4b549bf-7jlgn   1/1     Running   0          3m41s
vietdeploy1-7bb4b549bf-nlq82   1/1     Running   0          3m39s
vietdeploy1-7bb4b549bf-qdtdf   1/1     Running   0          3m41s
vietdeploy1-7bb4b549bf-w7jh9   1/1     Running   0          3m41s
vietdeploy1-7bb4b549bf-wn56p   1/1     Running   0          3m39s
```

➡️ All Pods are re-deployed. By default, `Rolling deployment` is used and there
is no downtime.
