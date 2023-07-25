#!/bin/bash

function countOnes() {
  local n=$1
  local count=0
  for (( i=1; i<=n; i++ )); do
    for (( j=1; j<=n; j++ )); do
      if [[ $i -eq $j ]]; then
        count=$((count+1))
      fi
    done
  done
  echo $count
}

n=$(< <(read -p "Enter the size of the matrix: "))
countOnes $n
