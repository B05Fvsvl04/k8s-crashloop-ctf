# verify/verify.sh
#!/bin/bash
# Killercoda ejecuta este script cuando el usuario hace clic en "Check"
# Retorna 0 si pasa, 1 si falla

FLAG=$(kubectl logs victima-pod -n ctf -p 2>/dev/null | grep -o 'FLAG{[^}]*}')

if [ "$FLAG" = "FLAG{pr3v10us_l0gs_n3v3r_l13}" ]; then
  exit 0
else
  exit 1
fi