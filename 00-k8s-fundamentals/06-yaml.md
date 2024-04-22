# ✅ Imperative vs Declarative

- Imperative: Explicit instructions. The system is stupid, you are smart.
- Declarative: Define outcome. The system is smart, you don't care.

## Example of Imperative:

```
kubectl run vietpod1 --image vietaws/eks:v1
```

## Example of Declarative:

```
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    app: vietpod1
    tier: free
    type: manual
  name: vietpod1
spec:
  containers:
  - image: vietaws/eks:v1
    imagePullPolicy: Always
    name: vietpod1
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}
```

# ✅ YAML Crash Course

## 1️⃣ Key Value Pair

```
name: vietaws
age: 18
```

## 2️⃣ Dictionary / Map Data type

```
person:
  name: vietaws
  age: 18
  isMale: true
```

## 3️⃣ List / Array Data Type

```
person:
  name: vietaws
  age: 18
  isMale: true
  albums:
    - name: family
      isPublic: false
      pictures: 100
    - name: saigon
      isPublic: true
      pictues: 25
  skills: ['python', 'javascript', 'aws']
  interests:
    - running
    - cycling
  display: {name: 'kevin', job: 'developer', level: 'newbie'}

```

# 4️⃣ Multiple lines

## 🍄 Using |

Example:

```
name: vietaws
age: 18
description: |
  This is a very long description
  about me.
```

➡️ `This is a very long description`**\n**`about me`**\n**
