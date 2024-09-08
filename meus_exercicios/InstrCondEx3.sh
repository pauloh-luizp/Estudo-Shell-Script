#!/bin/bash

read -p "Informe o Valor 1: " VALOR1
# caso o valor1 seja nulo
if [ $VALOR1 -z ]
then
  exit 2
fi
read -p "Informe o Valor 2: " VALOR2
# caso o valor2 seja nulo
if [ $VALOR2 -z ] 
then
  exit 2
fi

echo -e "\\nEscolha uma Operação: \\n1 = Soma\\n2 = Subtração\\n3 = Multiplicação\\n4 = Divisão\\nQ = Sair"
read -p "Opção: " OPC
echo ""

case $OPC in
  1)
    expr $VALOR1 + $VALOR2
    ;;
  2)
    expr $VALOR1 - $VALOR2
    ;;
  3)
    if [ ( $VALOR1 -eq 0 ) -o ( $VALOR2 -eq 0) ]
    then
      echo "Um dos valores é igual a 0"
      exit 2
    else
      expr $VALOR 1 * $VALOR2
    fi
    ;;
  4)
    if [ ( $VALOR1 -eq 0 ) -o ( $VALOR2 -eq 0) ]
    then
      echo "Um dos valores é igual a 0"
      exit 2
    else
      expr $VALOR 1 % $VALOR2
    fi
    ;;
  Q)
    exit 0
    ;;
  *)
    exit 2
    ;;
esac

