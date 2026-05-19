# Reto 1: Evidencia volátil

Algo salió mal en el namespace `ctf`. Un pod fue desplegado hace minutos y no levanta.

Los logs no te dirán nada útil. A veces la evidencia no está en lo que el pod *dice*, sino en lo que el pod *es*.

`kubectl get pods -n ctf`{{exec}}

Para comprobar que realmente encontraste la flag, guárdala así:

`echo "FLAG{...}" > /tmp/flag`{{copy}}

Luego haz clic en **Check**.