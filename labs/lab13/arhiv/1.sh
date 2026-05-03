#!/bin/bash

input_file=""
output_file=""
pattern=""
case_sensitive=""
show_lines=""

while getopts "i:o:p:Cn" opt; do
  case $opt in
    i) input_file="$OPTARG" ;;
    o) output_file="$OPTARG" ;;
    p) pattern="$OPTARG" ;;
    C) case_sensitive="-i" ;; 
    n) show_lines="-n" ;;
    *) echo "Ошибка: неверный ключ"; exit 1 ;;
  esac
done

if [[ -z "$input_file" || -z "$pattern" ]]; then
  echo "Ошибка: нужно указать -i inputfile и -p шаблон"
  exit 1
fi

if [[ ! -f "$input_file" ]]; then
  echo "Ошибка: файл $input_file не найден"
  exit 1
fi

result=$(grep $case_sensitive $show_lines "$pattern" "$input_file")

if [[ -n "$result" ]]; then
  if [[ -n "$output_file" ]]; then
    echo "$result" > "$output_file"
    echo "Результат сохранён в $output_file"
  else
    echo "$result"
  fi
else
  echo "Совпадений для '$pattern' не найдено"
  [[ -n "$output_file" && -f "$output_file" ]] && rm "$output_file"
  exit 1
fi
