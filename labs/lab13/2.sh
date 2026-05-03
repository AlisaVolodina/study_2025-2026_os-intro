#!/bin/bash
./2
result=$?

case $result in
  0) echo "Число равно нулю" ;;
  1) echo "Число больше нуля" ;;
  2) echo "Число меньше нуля" ;;
  *) echo "Неизвестный код" ;;
esac
