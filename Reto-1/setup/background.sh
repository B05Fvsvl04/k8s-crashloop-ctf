# setup/background.sh
kubectl create namespace ctf

kubectl apply -n ctf -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: victima-pod
  namespace: ctf
spec:
  restartPolicy: Always
  containers:
  - name: victima
    image: busybox
    command:
    - sh
    - -c
    - |
      if [ ! -f /state/ran ]; then
        echo 'FLAG{pr3v10us_l0gs_n3v3r_l13}'
        touch /state/ran
      fi
      exit 1
    volumeMounts:
    - name: state
      mountPath: /state
  volumes:
  - name: state
    hostPath:
      path: /tmp/ctf-state
      type: DirectoryOrCreate
EOF

# Esperar a que el pod haya crasheado al menos 2 veces
echo "Esperando reinicios..."
while true; do
  RESTARTS=$(kubectl get pod victima-pod -n ctf \
    -o jsonpath='{.status.containerStatuses[0].restartCount}' 2>/dev/null)
  [ "${RESTARTS:-0}" -ge 2 ] && break
  sleep 3
done