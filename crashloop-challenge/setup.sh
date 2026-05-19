#!/bin/bash

# Esperar a que el nodo de Kubernetes esté listo y kubectl responda
echo "Inicializando el entorno de Kubernetes..."
until kubectl get nodes &> /dev/null; do
  sleep 2
done

# Crear un namespace específico para el CTF (mantiene todo organizado)
kubectl create namespace ctf

# --- CONFIGURACIÓN RETO 1: El último grito de la víctima ---
# Creamos un pod que imprime la flag y muere inmediatamente (exit 1)
kubectl apply -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: victima-pod
  namespace: ctf
spec:
  containers:
  - name: app
    image: alpine:latest
    command: ["/bin/sh", "-c"]
    args:
    - "echo 'FLAG{logs_previos_salvan_vidas}'; exit 1"
EOF

# --- CONFIGURACIÓN RETO 2: El misterio del ConfigMap perdido ---
# Un pod que intenta montar un ConfigMap que NO existe
kubectl apply -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: misterio-pod
  namespace: ctf
spec:
  containers:
  - name: web
    image: nginx:alpine
    volumeMounts:
    - name: config-volume
      mountPath: /etc/config
  volumes:
  - name: config-volume
    configMap:
      name: flag-config-secreta
EOF

# Creamos el ConfigMap pero con OTRO nombre para despistar, 
# la flag real se creará cuando solucionen el problema (opcional), 
# pero para este CTF pondremos la flag dentro de los datos del CM correcto si logran crearlo.
# Para hacérselo directo: guardamos la flag en un CM que sí existe pero el pod busca el incorrecto.
kubectl create configmap flag-config-correcta --from-literal=flag="FLAG{describe_revela_el_secreto}" -n ctf


# --- CONFIGURACIÓN RETO 3: El canario en la mina de la RAM ---
# Un pod con un límite de memoria bajísimo (10Mi) que ejecuta un comando que consume más que eso
kubectl apply -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: canario-pod
  namespace: ctf
spec:
  containers:
  - name: memory-hog
    image: alpine:latest
    command: ["/bin/sh", "-c"]
    args:
    - "echo 'Iniciando proceso pesado...'; dd if=/dev/zero of=/dev/null bs=50M count=1; echo 'FLAG{oomkilled_por_tacio_con_ram}'"
    resources:
      limits:
        memory: "10Mi"
      requests:
        memory: "10Mi"
EOF

echo "¡Entorno del CTF preparado y roto con éxito!"