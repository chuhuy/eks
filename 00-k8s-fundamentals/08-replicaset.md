# ✅ Benefit:

- Maintain and running set of pods.
- If the pod is down, k8s can provision another pod. Maintain HA and resilency
  for application.
- Can `scale` replicaset up/down
- Group pod by using `labels`
- If you set `replicas=3`, and you have an existing pod with `matched label`.
  k8s only create two another pods.

# 1️⃣ Create replicaset's manifest

- Go to https://kubernetes.io
- Search `replicaset`

## ⭐️ Replicaset's manifest:

```
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: frontend
  labels:
    app: user-mgnt
    tier: frontend
    env: dev
spec:
  # modify replicas according to your case
  replicas: 3
  selector:
    matchLabels:
      tier: frontend
  template:
    metadata:
      labels:
        tier: frontend
    spec:
      containers:
      - name: vietaws
        image: vietaws/eks:v3
```

Save the manifest to file: `rs-demo.yaml`

## ⭐️ Run the manifest

```
kubectl create -f rs-demo.yaml
```

➡️ Output: `replicaset.apps/frontend created`

# 2️⃣ Verify ReplicaSet

## ✅ Check replicaset status

```
kubectl get rs
```

Output:

```
NAME       DESIRED   CURRENT   READY   AGE
frontend   3         3         3       39s
```

➡️ There are 3 pods **READY**

## ✅ Check all pods

```
kubectl get pods
```

Output:

```
NAME             READY   STATUS    RESTARTS   AGE
frontend-56ctg   1/1     Running   0          112s
frontend-92chj   1/1     Running   0          112s
frontend-bccm8   1/1     Running   0          112s
```

## ✅ Check Pod detail

```
kubectl describe pods frontend-56ctg
```

`frontend-56ctg` is Pod name

Output:

```
Name:             frontend-56ctg
Namespace:        default
Priority:         0
Service Account:  default
Node:             ip-192-168-12-246.ap-southeast-1.compute.internal/192.168.12.246
Start Time:       Tue, 23 Apr 2024 03:10:53 +0700
Labels:           tier=frontend
Annotations:      <none>
Status:           Running
IP:               192.168.17.248
IPs:
  IP:           192.168.17.248
Controlled By:  ReplicaSet/frontend
Containers:
  vietaws:
    Container ID:   containerd://0f340d8247e914748e591bdb1f21737834b04ceffa7a2ed05eeba6c93ccae8c1
    Image:          vietaws/eks:v3
    Image ID:       docker.io/vietaws/eks@sha256:0cc3c5985f4e1fdc80197bce5ca4ab34902d57d9202dc1bd64da6b63d0c5dbf6
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Tue, 23 Apr 2024 03:10:54 +0700
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-r8ndm (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True
  Initialized                 True
  Ready                       True
  ContainersReady             True
  PodScheduled                True
Volumes:
  kube-api-access-r8ndm:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age    From               Message
  ----    ------     ----   ----               -------
  Normal  Scheduled  3m23s  default-scheduler  Successfully assigned default/frontend-56ctg to ip-192-168-12-246.ap-southeast-1.compute.internal
  Normal  Pulled     3m22s  kubelet            Container image "vietaws/eks:v3" already present on machine
  Normal  Created    3m22s  kubelet            Created container vietaws
  Normal  Started    3m22s  kubelet            Started container vietaws
```
