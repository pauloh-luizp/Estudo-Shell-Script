#!/bin/bash

##############################################
#
# Script para verificar se um processo está
# ou não em execução
#
##############################################

while true
do
  if ps axu | grep $1 | grep -v grep > /dev/null
  then
      echo $1 Iniciado!
  else
    echo "ATENÇÃO!!!!! O processo $1 NÃO está em execução!"
  fi
done
