#!/bin/bash
FLAG=$(cat /tmp/flag 2>/dev/null | tr -d '[:space:]')

if [ "$FLAG" = "FLAG{m3t4d4t4_n3v3r_l13s}" ]; then
  exit 0
else
  exit 1
fi