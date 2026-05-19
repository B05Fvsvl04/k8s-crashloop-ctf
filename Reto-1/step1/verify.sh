#!/bin/bash

# 1. Si el archivo no existe, bloquea inmediatamente (exit 1)
if [ ! -f /tmp/flag ]; then
  exit 1
fi

# 2. Si existe, extrae y limpia el contenido
FLAG=$(cat /tmp/flag | tr -d '[:space:]')

# 3. Compara de forma exacta
if [ "$FLAG" = "FLAG{m3t4d4t4_n3v3r_l13s}" ]; then
  exit 0
else
  exit 1
fi
