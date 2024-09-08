#!/bin/bash

################################
# Verifica a porcentagem de uso 
# das partições /dev/
###############################



#while true
#do
  df --output=source,pcent | grep /dev/ | tr -s " " | tr -d % | cut -d ' ' -f2 > pcentuse.txt
# for i in $(cat log.txt | tr -d % | awk '{ print substr( $0, length($0)-3, lenght($0)-1 ) }' > log2.txt ; cat log2.txt)
for i in $(cat pcentuse.txt)
  do
    PARTICAO=$(head -$i pcentuse.txt | tail +$i | cut -d ' ' -f1)
    USO=$(head -$i pcentuse.txt | tail +$i | cut -d ' ' -f2)
    if [ $USO -gt 10 ]
    then
      echo "A particao $PARTICAO está com $USO %, o limite é de 10"
    fi
  done

#done
