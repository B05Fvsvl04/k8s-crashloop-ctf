#!/bin/bash
kubectl create namespace ctf

kubectl apply -n ctf -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: victima-pod
  namespace: ctf
  annotations:
    flag: "FLAG{m3t4d4t4_n3v3r_l13s}"
    equipo: "backend"
    version: "1.0.3"
spec:
  restartPolicy: Always
  containers:
  - name: victima
    image: busybox
    command: ["sh", "-c", "exit 1"]
EOF