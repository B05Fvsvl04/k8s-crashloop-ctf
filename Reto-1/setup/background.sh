#!/bin/bash
kubectl create namespace ctf

kubectl apply -n ctf -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: victima-pod
  namespace: ctf
spec:
  containers:
  - name: victima
    image: busybox
    command: ["sh", "-c", "echo 'FLAG{pr3v10us_l0gs_n3v3r_l13}' && exit 1"]
  restartPolicy: Always
EOF