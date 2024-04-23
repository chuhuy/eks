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

### Output

Deployment

```
NAME          READY   UP-TO-DATE   AVAILABLE   AGE
vietdeploy1   1/1     1            1           29s
```

ReplicaSet

```
NAME                     DESIRED   CURRENT   READY   AGE
vietdeploy1-6867597758   1         1         1       57s
```

Pods

```
NAME                           READY   STATUS    RESTARTS   AGE
vietdeploy1-6867597758-vlbjr   1/1     Running   0          89s
```

# 2️⃣ Scale Deployment

## Scale Out

### Commands

```
kubectl scale --replicas=4 deployment/<deployment-name>
kubectl scale --replicas=4 deployment/vietdeploy1
# Output: deployment.apps/vietdeploy1 scaled

# Verify Deployment
kubectl get deploy
kubectl get rs
kubectl get pods
```

### Output

```
# Deployment
NAME          READY   UP-TO-DATE   AVAILABLE   AGE
vietdeploy1   4/4     4            4           8m28s

# ReplicaSet
NAME                     DESIRED   CURRENT   READY   AGE
vietdeploy1-6867597758   4         4         4       8m59s

# Pod
NAME                           READY   STATUS    RESTARTS   AGE
vietdeploy1-6867597758-6zpfz   1/1     Running   0          52s
vietdeploy1-6867597758-895ng   1/1     Running   0          52s
vietdeploy1-6867597758-vlbjr   1/1     Running   0          9m14s
vietdeploy1-6867597758-zt4t9   1/1     Running   0          52s
```

## Scale In

### Commands

```
kubectl scale --replicas=2 deployment/vietdeploy1

# Verify

kubectl get deployments
kubectl get rs
kubectl get pods

```

### Output

```
# Deployment
NAME          READY   UP-TO-DATE   AVAILABLE   AGE
vietdeploy1   2/2     2            2           10m

# ReplicaSet
NAME                     DESIRED   CURRENT   READY   AGE
vietdeploy1-6867597758   2         2         2       10m

# Pods
NAME                           READY   STATUS    RESTARTS   AGE
vietdeploy1-6867597758-895ng   1/1     Running   0          2m43s
vietdeploy1-6867597758-vlbjr   1/1     Running   0          11m
```

# 3️⃣ Expose Deployment as a Service

```
# Expose Deployment as a Service
kubectl expose deployment <deployment-name> --type=NodePort --port=8080
--name=<service-name>

kubectl expose deployment vietdeploy1 --type=NodePort --port=8080 --name=service1
# Output: service/service1 exposed

# Get Service Info
kubectl get svc

# Get Public IP of Worker Nodes
kubectl get nodes -owide
```

Output

```
# kubectl get svc
NAME         TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
kubernetes   ClusterIP   10.100.0.1      <none>        443/TCP          3d18h
service1     NodePort    10.100.153.52   <none>        8080:31975/TCP   5s

# kubectl get pods
NAME                           READY   STATUS    RESTARTS   AGE
vietdeploy1-6867597758-895ng   1/1     Running   0          7m53s
vietdeploy1-6867597758-vlbjr   1/1     Running   0          16m

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

# Output: deployment.apps/vietdeploy1 image updated
```

### 🔑 Before

Deployment

```

kubectl get deployments

NAME READY UP-TO-DATE AVAILABLE AGE vietdeploy1 5/5 5 5 3m22s

```

ReplicaSet

```

kubectl get rs

NAME DESIRED CURRENT READY AGE vietdeploy1-6867597758 0 0 0 3m38s
vietdeploy1-7bb4b549bf 5 5 5 40s

```

Pods

```

kubectl get pods

NAME READY STATUS RESTARTS AGE vietdeploy1-5fd8d5c7cb-fjzhd 1/1 Running 0 3m22s
vietdeploy1-5fd8d5c7cb-gjglv 1/1 Running 0 3m22s vietdeploy1-5fd8d5c7cb-lmzvg
1/1 Running 0 3m23s vietdeploy1-5fd8d5c7cb-qf9ts 1/1 Running 0 3m23s
vietdeploy1-5fd8d5c7cb-tbnq9 1/1 Running 0 3m21s

```

### 💎 After

✅ ReplicaSet

```

kubectl get rs

NAME DESIRED CURRENT READY AGE vietdeploy1-5fd8d5c7cb 0 0 0 5m43s
vietdeploy1-7bb4b549bf 5 5 5 48s

```

🌈 New Pods go from OLD ReplicaSet `vietdeploy1-5fd8d5c7cb` to NEW ReplicaSet
`vietdeploy1-7bb4b549bf`

✅ Pods

```

kubectl get pods

NAME READY STATUS RESTARTS AGE vietdeploy1-7bb4b549bf-7jlgn 1/1 Running 0 3m41s
vietdeploy1-7bb4b549bf-nlq82 1/1 Running 0 3m39s vietdeploy1-7bb4b549bf-qdtdf
1/1 Running 0 3m41s vietdeploy1-7bb4b549bf-w7jh9 1/1 Running 0 3m41s
vietdeploy1-7bb4b549bf-wn56p 1/1 Running 0 3m39s

```

➡️ All Pods are re-deployed. By default, `Rolling deployment` is used and there
is no downtime.

```

```

```

```

```

```

```

```
