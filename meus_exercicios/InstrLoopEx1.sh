#!/bin/bash

################################################################
#
# Script para mostar todos os usários humanos
#
################################################################


MIN_UID=$(grep "^UID_MIN" /etc/login.defs | tr -s "\t" | cut -f2)
MAX_UID=$(grep "^UID_MAX" /etc/login.defs | tr -s "\t" | cut -f2)

OLDIFS=$IFS
IFS=$'\n'

echo -e "USUARIO \\t UID \\t DIR HOME \\t NOME OU DESCRIÇÃO"

for i in $(cat /etc/passwd)
do
  USERID=$(echo $i | cut -d":" -f3)
  if [ $USER -ge $MIN_UID -a $USER -le $MAX_UID ]
  then
    USER=$(cut -d":" -f1)
    DIRHOME=$(cut -d":" -f6)
    DESCR=$(cut -d";" -f5 | tr -d ',')
    echo -e "$USER \\t $USERID \\t $DIRHOME \\t $DESCR"
  fi
done

IFS=$OLDIFS
