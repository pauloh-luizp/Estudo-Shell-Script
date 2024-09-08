#!/bin/bash

#####################################
# Script para criar um aquivo 
# com tamanho e contudo defindo
# pelo usuario
#####################################

read -p "Informe o nome do arquivo a ser criado: " NOMEARQ
read -p "Informe um conjunto de carateres que será usado para preencher o aquivo: " CARACTERES
read -p "Informe o tamanho final do arquivo (em bytes): " TAMANHO

cat /dev/null > $NOMEARQ

echo $NOMEARQ
echo $CARACTERES
echo $TAMANHO

until [ $TAMANHO -le $(stat --printf=%s "$NOMEARQ") ]
do
  echo $CATACTERES>>$NOMEARQ
  QTDBYTES=$(stat --printf=%s "$NOMEARQ")
  echo "Tamanho do arquivo: $QTDBYTES"
done


