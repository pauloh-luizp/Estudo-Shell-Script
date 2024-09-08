#!/bin/bash

###################################################
# Script para gerar um backup do diretorio home
###################################################

DIRETORIO="/home/$1/Backup"
AGORA=$(date +%Y%m%d%H%M)
SEMANAPASSADA=$(date -d 'now - 7 days' +%Y%m%d%H%M)
NOMEBACKUP="backup_home_$AGORA.tgz"
OPCAO=""

echo $SEMANAPASSADA

if [ ! -d $DIRETORIO ]
then
  mkdir $DIRETORIO
  touch /home/$1/Backup/backup_home_0000000000000.tgz
fi

ULTIMOBACKUP=$(ls /home/$1/Backup -1t | grep backup_home_ | head -1 | cut -c13- | tr -d '.tgz')

echo $ULTIMOBACKUP

if [ $ULTIMOBACKUP -gt $SEMANAPASSADA ]
then
  echo "Já foi gerado um backup do diretorio /home/$1 nos últimos 7 dias."
  echo "Deseja continuar? (N/s):"
  echo "Será criado mais um backup para a mesma semana"
  read OPCAO
  case $OPCAO in
    [sS])
      echo "Criando Backup..."
      tar -czf /home/$1/Backup/$NOMEBACKUP /home/$1
      echo "O backup de nome \"$NOMEBACKUP\" foi criado em /home/$1/Backup"
      echo "Backup Concluído!"
      ;;
    [nN])
      exit 2
      ;;
  esac
fi

