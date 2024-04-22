# 1️⃣ Kubernetes's manifest

Sketelon:

```
kubectl get pod
```

```
apiVersion:
kind:
metadata:

spec:


```

Pod Example:

```
apiVersion: v1
kind: Pod
metadata: #Map
  name: vietpod1
  labels: #Map
	  app: vietpod1
    env: dev
    author: vietaws
    tier: free
spec:
  containers: #List
    - name: vietaws #Map
      image: vietaws/eks:v1
      imagePullPolicy: Always
      ports: #List
      - containerPort: 8080

```
