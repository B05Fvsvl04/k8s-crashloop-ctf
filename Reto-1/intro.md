# Reto 1: Evidencia volátil

Algo salió mal en el namespace `ctf`. Un pod fue desplegado hace minutos y ya está muerto, o peor: atrapado en un bucle sin fin, muriendo una y otra vez.

Tu misión es recuperar su último mensaje antes de que desaparezca para siempre.

---

### 1. Evalúa la escena del crimen

Lista los pods en el namespace:

`kubectl get pods -n ctf`{{exec}}

El pod `victima-pod` no está bien. Confirma su estado antes de continuar.

### 2. Intenta lo obvio

`kubectl logs victima-pod -n ctf`{{exec}}

Nada útil. El contenedor actual murió demasiado rápido, o aún no ha llegado a decir nada.

### 3. Recupera la evidencia

Los logs del contenedor **anterior** aún existen. Hay una bandera en `kubectl logs` que te permite consultarlos.

Encuéntrala, ejecútala, y ahí estará tu `FLAG{...}`.

---

Una vez obtengas la flag, haz clic en **Next** para avanzar al Reto 2.