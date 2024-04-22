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
- Search `replicaset` / Click on first result
