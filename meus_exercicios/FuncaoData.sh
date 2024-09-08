#!/bin/bash

#####################################
# função para transofrmar a data
# conforme parametros
#####################################

formatodata (){ # Retorna o formato da data
   
  if [ $2 -le 12 -a $1 -le 30 -a $1 -ne $2 ]
  then # padrão BR
    echo "Padrão BR"
    DATA=0
  fi
      
  if [ $1 -le 12 -a $2 -le 30 -a $1 -ne $2 ]
  then # padrão US
    echo "Padrão US"
    DATA=1
  fi

  if [ $1 -eq $2 ]
  then # impossivel determinar
    DATA=2
  fi

  if [ $1 -gt 30 -o $2 -gt 30 ]
  then # dia ou mês inválidos
    DATA=3
  fi

}


invertedata(){ # Inverte o formato da data
  
  if [ $2 -le 12 -a $1 -le 30 -a $1 -ne $2 ]
  then # padrão BR --> padrão US
    echo "Padrão BR --> Padrão US"
    DATA=$(echo "$2/$1/$3")
  fi
      
  if [ $1 -le 12 -a $2 -le 30 -a $1 -ne $2 ]
  then # padrão US --> padrão BR
    echo "Padrão US --> Padrão BR"
    DATA=$(echo "$1/$2/$3")
  fi

}


incluibarras() {

  if [ $2 -le 12 -a $1 -le 30 -a $1 -ne $2 ]
  then # padrão BR
    echo "Padrão BR"
    DATA=$(echo "$1/$2/$3")
  fi
      
  if [ $1 -le 12 -a $2 -le 30 -a $1 -ne $2 ]
  then # padrão US
    echo "Padrão US"
    DATA=$(echo "$1/$2/$3")
  fi

  if [ $1 -eq $2 ]
  then # impossivel determinar
    DATA=$(echo "Impossivel determinar")
  fi

  if [ $1 -gt 30 -o $2 -gt 30 ]
  then # dia ou mês inválidos
    DATA=$(echo "Dia ou mês inválidos")
  fi

}

exibeporextenso() {

  local MES

  if [ $2 -le 12 -a $1 -le 30 -a $1 -ne $2 ]
  then # padrão BR
    MES=$(date -d "$3-$2-$1" +%b)
    DATA=$(echo "$1 de $MES de $3")
  fi
      
  if [ $1 -le 12 -a $2 -le 30 -a $1 -ne $2 ]
  then # padrão US
    MES=$(date -d "$3-$1-$2" +%b)
    DATA=$(echo "$2 de $MES de $3")
  fi

  if [ $1 -eq $2 ]
  then # impossivel determinar
    DATA=$(echo "Impossivel determinar")
  fi

  if [ $1 -gt 30 -o $2 -gt 30 ]
  then # dia ou mês inválidos
    DATA=$(echo "Dia ou mês inválidos")
  fi

}

D1=$(echo $2 | tr -d '/' | cut -c 1-2)
D2=$(echo $2 | tr -d '/' | cut -c 3-4)
D3=$(echo $2 | tr -d '/' | cut -c 5-8)

# echo "Parâmetro: $PARAMETRO"
# echo "D1: $D1"
# echo "D2: $D2"
# echo "D3: $D3"

case $1 in
  "-f")
      formatodata $D1 $D2 $D3
      echo $DATA
      ;;
  "-i")
      invertedata $D1 $D2 $D3
      echo $DATA
      ;;
  "-b")
      incluibarras $D1 $D2 $D3
      echo $DATA
      ;;
  "-e")
      exibeporextenso $D1 $D2 $D3
      echo $DATA
      ;;
    *)
      echo "Nada aqui!"
      ;;
esac
