#!/bin/bash

if [[ $# -ne 2 ]]; then
  echo "Использование: $0 --create N  или  $0 --remove N"
  exit 1
fi

mode=$1
N=$2

if [[ "$mode" == "--create" ]]; then
  for i in $(seq 1 $N); do
    touch "$i.tmp"
  done
  echo "Создано $N файлов"
elif [[ "$mode" == "--remove" ]]; then
  for i in $(seq 1 $N); do
    rm -f "$i.tmp"
  done
  echo "Удалено $N файлов"
else
  echo "Неверный режим. Используйте --create или --remove"
fi
