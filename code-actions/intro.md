# Reto 1: El último grito de la víctima 👻

¡Bienvenido al CTF de Troubleshooting en Kubernetes! Algo terrible ha pasado en nuestro namespace de simulación. Desplegamos una aplicación crucial, pero está atrapada en un bucle eterno de desesperación.

Tu misión en este primer nivel es encontrar la primera **FLAG**.

### 1. Diagnóstico inicial
Primero, veamos qué está pasando en nuestro entorno de retos. Ejecuta el comando para listar los pods en el namespace `ctf`:

`kubectl get pods -n ctf` {{exec}}

Verás que el pod llamado `victima-pod` se encuentra en estado `CrashLoopBackOff` o `Error`. 

### 2. El problema
Si intentas ver los logs normales del pod con el comando habitual, notarás que está "iniciando" o simplemente no muestra nada útil porque el contenedor actual está vacío o muriendo al instante:

`kubectl logs victima-pod -n ctf` {{exec}}

### 3. Tu pista mental
Tal y como decía nuestro checklist: *"El pod actual está iniciando, así que no tiene logs. El secreto es usar la bandera `-p` (previous)"*. 

**Tu objetivo:** Ejecuta el comando correcto usando la bandera de persistencia histórica de logs para escuchar "el último grito" del contenedor antes de morir. Ahí encontrarás la estructura `FLAG{...}`.

---

¿Lograste recuperar la primera flag? Introduce el comando correcto en la terminal para descubrirla y haz clic en **Next** para avanzar al Reto 2.