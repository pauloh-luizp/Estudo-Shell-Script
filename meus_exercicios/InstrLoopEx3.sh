#!/bin/bash

#######################################
# Inspenciona a home de todos os
# usuarios e busca e conta os arquvios
# com extensão jpg mp4 e mp3
#######################################

USERS=$(ls /home/)

for i in $(ls /home/)
do
  echo "Usuário: $i"
  JPG=$(find /home/$i -name '*.jpg' | wc -l)
  echo "Quantidade de Arquivos JPG: $JPG"
  MP4=$(find /home/$i -name '*.mp4' | wc -l)
  echo "Quantidade de Arquivos MP4: $MP4"
  MP3=$(find /home/$i -name '*.mp3' | wc -l)
  echo "Quantidade de arquivos MP3: $MP3"
done
