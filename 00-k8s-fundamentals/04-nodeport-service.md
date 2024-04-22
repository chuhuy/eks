# 0️⃣ Expose Pod as a service

**✅ Benefit**: By default, pod is private. You want the pod to be public, you
have to expose Pod as a **Node Port** Service or **LoadBalancing** Service.

Command:

```
kubectl expose pod <pod_name> --type=NodePort --port=<service_port> --target-port=<container_port> --name=<service_name>
```

Example:

```
kubectl expose pod vietpod1 --type=NodePort --port=8081 --target=8080 --name=service1
```

‼️ Notes:

- Container is running at port 8080
- Pod will run at port 8081. Normally, we will configure `port` and
  `target-port` in same port. But I want to make it clear to easy understanding.
- User will not access via `port 8081`. Each `NodePort` service will have a
  separated public port with the range: `32000-32767`
- When we use imperative way, we cannot specific NodePort, k8s will pick a
  random port. In declarative way, we can specific port in yaml file.
