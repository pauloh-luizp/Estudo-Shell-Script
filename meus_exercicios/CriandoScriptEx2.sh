#!/bin/bash

#################################################
# Script que gera um relatório da máquina atual #
#################################################

MAQUINA=$(uname -n)
HORAATUAL=$(date)
ATIVADESDE=$(uptime -s)
KERNEL=$(uname -r)
QTDCPUS=$(head -14 /proc/cpuinfo | grep "cpu cores" | cut -f2 -d":")
CPUNAME=$(head -14 /proc/cpuinfo | grep "model name" | cut -f2 -d":")
MEMTOTAL=$(head -1 /proc/meminfo | grep "MemTotal" | cut -f2 -d":")


echo ==================================================================
echo Relatório da Máquina: "$MAQUINA"
echo Data/Hora: "$HORAATUAL"
echo ==================================================================
echo ""
echo "Máquina ativa desde: $ATIVADESDE"
echo ""
echo "Versão do Kernel: $KERNEL"
echo ""
echo "CPUS: "
echo "Quantidade de CPUs/Core: $QTDCPUS"
echo "Modelo da CPU: $CPUNAME"
echo ""
echo "Memória Total: $MEMTOTAL"
echo ""
echo "Partições:"
df
