#!/bin/bash

HORAATUAL=$(date "+%H")

if [ $HORAATUAL -ge 6 -a $HORAATUAL -lt 12 ]
then
  echo "Bom dia!"
elif [ $HORAATUAL -ge 12 -a $HORAATUAL -lt 18 ] 
then
  echo "Boa tarde!"
else
  echo "Boa noite!"
fi
