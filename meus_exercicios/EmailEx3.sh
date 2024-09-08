#!/bin/bash

##########################################
# script para monitorar a particao de swap
# registra no log e/ou manda e-mail quando
# necessário
##########################################

SWAPTOTAL=$(free -m | grep Swap: | tr -s ' ' | cut -d$' ' -f2)
SWAPUSADO=$(free -m | grep Swap: | tr -s ' ' | cut -d$' ' -f3)
DESTINO="paulo"

PCENTUSADO=$(expr $SWAPUSADO \* 100)
PCENTUSADO=$(expr $PCENTUSADO / $SWAPTOTAL)

PCENTUSADO=$1



if [ $PCENTUSADO -ge 50 ]
then
  logger -p local0.err -t [$0] "A particao de Swap atingiu $PCENTUSADO %"
fi

if [ $PCENTUSADO -ge 80 ]
then
  CONTEUDO=$(date ; echo "A particao de Swap atingiu um nivel crítico de $PCENTUSADO %")
  echo -e $CONTEUDO | mail -s "Uso da particao de Swap monitorado pelo Script $0" $DESTINO
fi
