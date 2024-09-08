#!/bin/bash

##############################################
#
# Script para verificar se um processo está
# ou não em execução
#
##############################################

DESTINO="paulo"

while true
do
  if ps axu | grep $1 | grep -v grep | grep -v $0 > /dev/null
  then
    sleep 3
  else
    CONTEUDO=$(date ; echo "ATENÇÃO!!!!! O processo $1 NÃO está em execução!")
    echo -e $CONTEUDO | mail -s "Status do processo $1 monitorado pelo Script $0" $DESTINO
    sleep 3
  fi
done
