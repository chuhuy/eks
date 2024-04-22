# 0️⃣ List all Pods

Command:

```
kubectl get pods
```

Output example:

```
NAME             READY   STATUS    RESTARTS   AGE
vietaws-lkmgs    1/1     Running   0          32h
vietaws-qskmg    1/1     Running   0          32h
vietaws-wrrvh    1/1     Running   0          32h
vietaws2-2cx8b   1/1     Running   0          32h
vietaws2-7vxs2   1/1     Running   0          32h
vietaws2-hwrsz   1/1     Running   0          32h
```

Options:

- `kubectl get pods -A` - get all pods for all namespaces
- `kubectl get pods -owide` - get all pods for default namespace with more
  detail

```
NAME             READY   STATUS    RESTARTS   AGE   IP               NODE                                                NOMINATED NODE   READINESS GATES
vietaws-lkmgs    1/1     Running   0          32h   192.168.50.79    ip-192-168-35-199.ap-southeast-1.compute.internal   <none>           <none>
vietaws-qskmg    1/1     Running   0          32h   192.168.16.145   ip-192-168-12-246.ap-southeast-1.compute.internal   <none>           <none>
vietaws-wrrvh    1/1     Running   0          32h   192.168.17.248   ip-192-168-12-246.ap-southeast-1.compute.internal   <none>           <none>
vietaws2-2cx8b   1/1     Running   0          32h   192.168.58.194   ip-192-168-35-199.ap-southeast-1.compute.internal   <none>           <none>
vietaws2-7vxs2   1/1     Running   0          32h   192.168.55.123   ip-192-168-35-199.ap-southeast-1.compute.internal   <none>           <none>
vietaws2-hwrsz   1/1     Running   0          32h   192.168.9.252    ip-192-168-12-246.ap-southeast-1.compute.internal   <none>           <none>
```
