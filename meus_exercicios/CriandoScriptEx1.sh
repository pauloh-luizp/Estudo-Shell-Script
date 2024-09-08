#!/bin/bash

############################################################
# Script que soma dois números digitados pelo usuário
############################################################

read -p "Digite o primeiro número " NUM1
read -p "Digite o segundo número " NUM2

echo " $(expr $NUM1 + $NUM2)"
